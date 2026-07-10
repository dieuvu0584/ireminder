import 'ai_provider.dart';
import 'http_json_client.dart';

class AnthropicProvider implements AiProvider {
  @override
  String get id => 'anthropic';

  @override
  String get displayName => 'Anthropic (Claude)';

  @override
  String get defaultModel => 'claude-haiku-4-5';

  @override
  String get apiKeyHelpUrl => 'https://console.anthropic.com/settings/keys';

  @override
  Future<String> sendMessage({
    required String apiKey,
    required String model,
    required String systemContext,
    required String userQuestion,
  }) async {
    final json = await HttpJsonClient.postJson(
      uri: Uri.parse('https://api.anthropic.com/v1/messages'),
      headers: {
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: {
        'model': model,
        'max_tokens': 1024,
        'system': systemContext,
        'messages': [
          {'role': 'user', 'content': userQuestion},
        ],
      },
    );

    try {
      final content = json['content'] as List;
      final text = content
          .whereType<Map<String, dynamic>>()
          .firstWhere((b) => b['type'] == 'text')['text'] as String;
      return text;
    } catch (_) {
      throw AiProviderException('Unexpected response format from Anthropic.');
    }
  }
}
