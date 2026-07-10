import 'ai_provider.dart';
import 'anthropic_provider.dart';
import 'gemini_provider.dart';
import 'openai_provider.dart';

/// Adding a new provider later = write one file implementing [AiProvider]
/// and register it here. Nothing else (context building, UI, storage)
/// needs to change.
class AiProviderFactory {
  static final List<AiProvider> _providers = [
    AnthropicProvider(),
    OpenAiProvider(),
    GeminiProvider(),
  ];

  static List<AiProvider> get all => List.unmodifiable(_providers);

  static AiProvider? byId(String? id) {
    if (id == null) return null;
    for (final p in _providers) {
      if (p.id == id) return p;
    }
    return null;
  }
}
