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
        throw AiProviderException(_mapHttpError(response.statusCode));
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

  static String _mapHttpError(int statusCode) {
    switch (statusCode) {
      case 401:
      case 403:
        return 'Invalid API key. Check it in Settings.';
      case 429:
        return 'Rate limit or quota exceeded. Try again later.';
      default:
        return 'AI provider returned an error ($statusCode).';
    }
  }
}
