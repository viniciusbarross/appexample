abstract class HttpAdapter {
  Future<dynamic> post(String uri, {dynamic data, dynamic headers});
  Future<dynamic> get(String uri, {dynamic headers});
  Future<dynamic> put(String uri, {dynamic data, dynamic headers});
  Future<dynamic> delete(String uri, {dynamic data, dynamic headers});
}
