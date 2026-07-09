import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/ai_context_builder.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/ai_chat_repository.dart';
import '../../data/repositories/ai_settings_repository.dart';
import '../../data/services/secure_key_storage.dart';
import '../../domain/ai_providers/ai_provider.dart';
import '../../domain/ai_providers/ai_provider_factory.dart';
import 'database_provider.dart';
import 'repository_providers.dart';

final aiSettingsRepositoryProvider = Provider<AiSettingsRepository>((ref) {
  return AiSettingsRepository(ref.watch(appDatabaseProvider));
});

final aiChatRepositoryProvider = Provider<AiChatRepository>((ref) {
  return AiChatRepository(ref.watch(appDatabaseProvider));
});

final secureKeyStorageProvider = Provider<SecureKeyStorage>((ref) {
  return SecureKeyStorage();
});

final aiSettingsStreamProvider = StreamProvider<AiSetting>((ref) {
  return ref.watch(aiSettingsRepositoryProvider).watch();
});

final aiChatHistoryStreamProvider =
    StreamProvider<List<AiChatHistoryData>>((ref) {
  return ref.watch(aiChatRepositoryProvider).watchHistory();
});

final aiSettingsActionsProvider = Provider<AiSettingsActions>((ref) {
  return AiSettingsActions(ref);
});

class AiSettingsActions {
  final Ref _ref;
  AiSettingsActions(this._ref);

  Future<void> setEnabled(bool enabled) =>
      _ref.read(aiSettingsRepositoryProvider).setEnabled(enabled);

  Future<void> setProvider(String providerId, String defaultModel) =>
      _ref.read(aiSettingsRepositoryProvider).setProvider(
            providerId,
            defaultModel,
          );

  Future<void> setModel(String model) =>
      _ref.read(aiSettingsRepositoryProvider).setModel(model);

  Future<void> setAllowedCategoryIds(Set<int> ids) =>
      _ref.read(aiSettingsRepositoryProvider).setAllowedCategoryIds(ids);

  /// Saves the key for [providerId] into secure storage. The key never
  /// touches the Drift database.
  Future<void> setApiKey(String providerId, String apiKey) =>
      _ref.read(secureKeyStorageProvider).setKey(providerId, apiKey);

  Future<String?> getApiKey(String providerId) =>
      _ref.read(secureKeyStorageProvider).getKey(providerId);
}

final aiChatActionsProvider = Provider<AiChatActions>((ref) {
  return AiChatActions(ref);
});

class AiChatActions {
  final Ref _ref;
  AiChatActions(this._ref);

  Future<void> clearHistory() =>
      _ref.read(aiChatRepositoryProvider).clearHistory();

  /// Sends [question] to whichever provider is configured, after building a
  /// fresh context from the current DB state (never cached — PROMPT.md §9,
  /// "không cache câu trả lời AI"). Throws [AiProviderException] with a
  /// message safe to show directly to the user.
  Future<String> ask(String question) async {
    final settings = await _ref.read(aiSettingsRepositoryProvider).get();
    if (!settings.isEnabled) {
      throw AiProviderException('The AI assistant is turned off.');
    }
    final provider = AiProviderFactory.byId(settings.providerId);
    if (provider == null) {
      throw AiProviderException('Choose an AI provider in Settings first.');
    }
    final apiKey = await _ref
        .read(secureKeyStorageProvider)
        .getKey(provider.id);
    if (apiKey == null || apiKey.isEmpty) {
      throw AiProviderException(
        'No API key saved for ${provider.displayName}. Add one in Settings.',
      );
    }
    final model = settings.modelName ?? provider.defaultModel;

    final allowedIds =
        _ref.read(aiSettingsRepositoryProvider).allowedCategoryIds(settings);

    final categories = await _ref.read(categoryRepositoryProvider).getAll();
    final reminders =
        await _ref.read(reminderRepositoryProvider).watchActive().first;
    final loans = await _ref.read(loanRepositoryProvider).watchActive().first;

    final loanInputs = <AiContextLoanInput>[];
    for (final loan in loans) {
      final installments = await _ref
          .read(loanRepositoryProvider)
          .watchInstallments(loan.id)
          .first;
      final nextPending = installments
          .where((i) => i.status == 'pending')
          .map((i) => i.dueDate)
          .fold<DateTime?>(null, (min, d) {
        if (min == null) return d;
        return d.isBefore(min) ? d : min;
      });
      loanInputs.add(
        AiContextLoanInput(
          categoryId: loan.categoryId,
          name: loan.name,
          totalInstallments: loan.totalInstallments,
          paidInstallments: loan.paidInstallments,
          nextDueDate: nextPending,
        ),
      );
    }

    final context = buildAiContext(
      reminders: reminders
          .map((r) => AiContextReminderInput(
                categoryId: r.categoryId,
                title: r.title,
                dueDate: r.nextDueDate,
              ))
          .toList(),
      loans: loanInputs,
      categories: categories
          .map((c) => AiContextCategoryInput(id: c.id, name: c.name))
          .toList(),
      allowedCategoryIds: allowedIds,
      now: DateTime.now(),
    );

    await _ref.read(aiChatRepositoryProvider).addMessage(
          role: 'user',
          content: question,
        );

    try {
      final answer = await provider.sendMessage(
        apiKey: apiKey,
        model: model,
        systemContext:
            'You are a helpful assistant inside a personal reminders app. '
            'Answer briefly and naturally using only the context below.\n\n'
            '$context',
        userQuestion: question,
      );
      await _ref.read(aiChatRepositoryProvider).addMessage(
            role: 'assistant',
            content: answer,
          );
      return answer;
    } on AiProviderException catch (e) {
      await _ref.read(aiChatRepositoryProvider).addMessage(
            role: 'assistant',
            content: e.userMessage,
          );
      rethrow;
    }
  }
}
