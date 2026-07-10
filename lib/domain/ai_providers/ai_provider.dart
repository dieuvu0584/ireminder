/// Raised for any provider-side failure (bad key, quota exceeded, network
/// error, malformed response). [userMessage] is already suitable to show
/// directly in the UI — never the raw exception/API error text, which may
/// echo back request details.
class AiProviderException implements Exception {
  final String userMessage;
  AiProviderException(this.userMessage);

  @override
  String toString() => userMessage;
}

/// Common interface every AI provider adapter implements. Each adapter owns
/// its own request/response format conversion (Anthropic Messages API,
/// OpenAI Chat Completions, Gemini generateContent, ...); everything above
/// this interface — context building, UI — stays provider-agnostic.
abstract class AiProvider {
  String get id; // "anthropic" | "openai" | "gemini"
  String get displayName;

  /// Cheapest/fastest model for this provider, used as the default in
  /// Settings. Providers update their model lineup often, so this is a
  /// suggestion the user can override, never hardcoded elsewhere.
  String get defaultModel;

  String get apiKeyHelpUrl;

  Future<String> sendMessage({
    required String apiKey,
    required String model,
    required String systemContext,
    required String userQuestion,
  });
}
