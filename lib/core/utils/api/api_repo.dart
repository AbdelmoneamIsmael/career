abstract class ApiRepo {
  Future<Map<String, dynamic>> getRequest({
    required String uri,
    Map<String, String>? additionalHeaders,
  });
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Object? data,
    Map<String, String>? additionalHeaders,
  });
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Object? data,
  });
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required Object? data,
    String? contentType,
  });
  Future<bool> cheekInterentConnection();
}
