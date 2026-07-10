import 'ai_provider.dart';
import 'http_json_client.dart';

class OpenAiProvider implements AiProvider {
  @override
  String get id => 'openai';

  @override
  String get displayName => 'OpenAI (ChatGPT)';

  @override
  String get defaultModel => 'gpt-4o-mini';

  @override
  String get apiKeyHelpUrl => 'https://platform.openai.com/api-keys';

  @override
  Future<String> sendMessage({
    required String apiKey,
    required String model,
    required String systemContext,
    required String userQuestion,
  }) async {
    final json = await HttpJsonClient.postJson(
      uri: Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {'Authorization': 'Bearer $apiKey'},
      body: {
        'model': model,
        'messages': [
          {'role': 'system', 'content': systemContext},
          {'role': 'user', 'content': userQuestion},
        ],
      },
    );

    try {
      final choices = json['choices'] as List;
      final message = (choices.first as Map<String, dynamic>)['message']
          as Map<String, dynamic>;
      return message['content'] as String;
    } catch (_) {
      throw AiProviderException('Unexpected response format from OpenAI.');
    }
  }
}
