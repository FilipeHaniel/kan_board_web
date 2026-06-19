abstract class HttpClient {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
