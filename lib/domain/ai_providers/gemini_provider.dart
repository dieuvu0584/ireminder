import 'ai_provider.dart';
import 'http_json_client.dart';

class GeminiProvider implements AiProvider {
  @override
  String get id => 'gemini';

  @override
  String get displayName => 'Google Gemini';

  @override
  String get defaultModel => 'gemini-2.0-flash';

  @override
  String get apiKeyHelpUrl => 'https://aistudio.google.com/apikey';

  @override
  Future<String> sendMessage({
    required String apiKey,
    required String model,
    required String systemContext,
    required String userQuestion,
  }) async {
    final json = await HttpJsonClient.postJson(
      uri: Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey',
      ),
      headers: const {},
      body: {
        'system_instruction': {
          'parts': [
            {'text': systemContext},
          ],
        },
        'contents': [
          {
            'parts': [
              {'text': userQuestion},
            ],
          },
        ],
      },
    );

    try {
      final candidates = json['candidates'] as List;
      final content =
          (candidates.first as Map<String, dynamic>)['content'] as Map<String, dynamic>;
      final parts = content['parts'] as List;
      return (parts.first as Map<String, dynamic>)['text'] as String;
    } catch (_) {
      throw AiProviderException('Unexpected response format from Gemini.');
    }
  }
}
