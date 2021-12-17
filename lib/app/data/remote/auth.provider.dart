import 'package:flutter_architecture/app/data/cache/storage.helper.dart';
import 'package:flutter_architecture/app/data/mappers/user_mapper.dart';
import 'package:flutter_architecture/app/domain/entities/http_response.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:flutter_architecture/app/data/remote/configs/endpoints.dart'
    as endpoints;
import 'package:flutter_architecture/core/extensions/cap_extension.dart';

class AuthProvider {
  final HttpClient _client;
  final StorageHelper _refs;

  AuthProvider(this._client, this._refs);

  Future<HttpResponse> login(String login, String password) async {
    HttpResponse response = HttpResponse();

    final String url = endpoints.login.auth;

    final payload = {login, password};

    final retAuth = _client.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      _refs.set(StorageKeys.token, token);
      _refs.set(StorageKeys.login, login);
      _refs.set(StorageKeys.password, password);

      response.statusCode = res.statusCode ?? 200;
      response.data = UserMapper.fromJson(res.data);
      response.message = res.statusMessage ?? "";
    }).catchError((e) {
      _refs.set(StorageKeys.token, "");
      _refs.set(StorageKeys.login, "");
      _refs.set(StorageKeys.password, "");

      response.statusCode = 500;
      response.data = e;
      response.message = "User not found";
    });
    return response;
  }

  Future<HttpResponse> loginTest(String login, String password) async {
    HttpResponse response = HttpResponse();
    final String url = endpoints.login.allAuth;
    if(login!= '123@gmail.com' && password != '123'){
      await Future.delayed(const Duration(seconds: 1));
      response.statusCode = 404;
      response.data = null;
      response.message = "Can't find user";
      return response;
    }
    final retAuth = _client.get(url);
    await retAuth.then((res) {
      Map<String, dynamic> data = res.data;
      if (data.containsKey('id')) {
        _refs.set(StorageKeys.uid, "${data["id"]}");
        response.statusCode = res.statusCode ?? 200;
        response.data = UserMapper.fromJson(data);
        response.message = res.statusMessage ?? "";
      } else {
        response.statusCode = 404;
        response.data = null;
        response.message = "Can't find user";
      }
    }).catchError((e) {
      response.statusCode = 500;
      response.data = e;
      response.message = "Error when fetch user";
    });
    return response;
  }

  Future<HttpResponse> tryLogin() async {
    final storageUid = await _refs.get(StorageKeys.uid);
    HttpResponse response = HttpResponse();
    if (storageUid != null) {
      final String url = endpoints.login.allAuth;
      final retAuth = _client.get(url + '/' + storageUid);
      await retAuth.then((res) {
        response = HttpResponse(
            statusCode: res.statusCode ?? 200,
            data: UserMapper.fromJson(res.data),
            message: "Fetch User is success!");
      }).catchError((e) {
        response = HttpResponse(
            statusCode: 500, data: e, message: "Api get user err!");
      });
    } else {
      response = HttpResponse(
          statusCode: 500, data: null, message: 'User is not logged in.');
    }
    return response;
  }
}
