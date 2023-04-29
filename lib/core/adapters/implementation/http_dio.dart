import 'package:dio/dio.dart';
import 'package:appexample/core/adapters/interfaces/http_adapter.dart';

class HttpDio implements HttpAdapter {
  Dio dio;

  HttpDio(this.dio);

  @override
  Future<dynamic> delete(String uri, {data, headers}) async {
    return await dio.delete(uri, data: data, options: Options(headers: headers));
  }

  @override
  Future<dynamic> get(String uri, {headers}) async {
    final response = await dio.get(uri, options: Options(responseType: ResponseType.json, headers: headers));

    return response;
  }

  @override
  Future<dynamic> post(String uri, {data, headers}) async {
    final response = await dio.post(uri, data: data, options: Options(responseType: ResponseType.json, headers: headers));

    return response;
  }

  @override
  Future<dynamic> put(String uri, {data, headers}) async {
    final response = await dio.put(uri, data: data, options: Options(responseType: ResponseType.json, headers: headers));

    return response;
  }
}
