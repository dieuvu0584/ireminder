import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'ai_provider.dart';

/// Minimal JSON-over-HTTPS POST helper shared by the AI provider adapters.
/// Uses dart:io's built-in HttpClient rather than adding a network package,
/// since this is the only place in the app that ever makes a network call.
class HttpJsonClient {
  static Future<Map<String, dynamic>> postJson({
    required Uri uri,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: 20);
    try {
      final request = await client.postUrl(uri);
      headers.forEach(request.headers.set);
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      request.add(utf8.encode(jsonEncode(body)));

      final response = await request.close().timeout(
        const Duration(seconds: 45),
      );
      final responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw AiProviderException(
          _mapHttpError(response.statusCode, responseBody),
        );
      }

      final decoded = jsonDecode(responseBody);
      if (decoded is! Map<String, dynamic>) {
        throw AiProviderException('Unexpected response from AI provider.');
      }
      return decoded;
    } on AiProviderException {
      rethrow;
    } on SocketException {
      throw AiProviderException(
        'Could not connect. Check your internet connection.',
      );
    } on TimeoutException {
      throw AiProviderException('The request timed out. Please try again.');
    } catch (_) {
      throw AiProviderException('Could not reach the AI provider.');
    } finally {
      client.close(force: true);
    }
  }

  static String _mapHttpError(int statusCode, String responseBody) {
    switch (statusCode) {
      case 401:
      case 403:
        return 'Invalid API key. Check it in Settings.';
      case 429:
        return _isQuotaError(responseBody)
            ? 'Out of quota: this API key has no usable credits/billing '
                  'left. Add billing or a payment method on the provider '
                  'account, then try again.'
            : 'Rate limit exceeded — too many requests too quickly. '
                  'Wait a bit and try again.';
      default:
        return 'AI provider returned an error ($statusCode).';
    }
  }

  /// OpenAI/Anthropic/Gemini all use HTTP 429 for both "too many requests
  /// per minute" (transient) and "no credits/billing left" (needs the user
  /// to act on their provider account) — the status code alone can't tell
  /// them apart, so this sniffs the error body's type/code/message for the
  /// quota-exhaustion signal each provider actually emits.
  static bool _isQuotaError(String responseBody) {
    final lower = responseBody.toLowerCase();
    return lower.contains('insufficient_quota') ||
        lower.contains('exceeded your current quota') ||
        lower.contains('billing');
  }
}
