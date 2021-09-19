import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/cache/storage.helper.dart';

class HttpClient {
  late Dio _client;

  HttpClient() {
    _client = Dio();
    _client.interceptors.add(_interceptor());
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) async {
      final storageToken = await StorageHelper.get(StorageKeys.token);
      if (storageToken != null) {
        options.headers.addAll({
          "Authorization": 'Bearer $storageToken',
        });
      }
      return handler.next(options);
    });
  }

  Future<Response> get(String url) => _client.get(url);

  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}
