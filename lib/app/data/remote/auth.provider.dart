import 'package:flutter_architecture/app/data/cache/storage.helper.dart';
import 'package:flutter_architecture/app/data/mappers/user_mapper.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';
import 'package:flutter_architecture/app/data/remote/configs/endpoints.dart'
    as endpoints;
import 'package:flutter_architecture/core/extensions/cap_extension.dart';

class AuthProvider {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> login(String login, String password) async {
    late HttpResponse response = HttpResponse();

    final String url = endpoints.login.auth;

    final payload = {login, password};

    final retAuth = client.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, login);
      StorageHelper.set(StorageKeys.senha, password);

      response.statusCode = res.statusCode ?? 200;
      response.data = UserMapper.fromJson(res.data);
      response.message = res.statusMessage ?? "";
    }).catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.login, "");
      StorageHelper.set(StorageKeys.senha, "");

      response.statusCode = 500;
      response.data = e;
      response.message = "User not found";
    });
    return response;
  }

  Future<HttpResponse> loginTest(String login, String password) async {
    late HttpResponse response = HttpResponse();
    final String url = endpoints.login.allAuth;
    final retAuth = client.get(url);
    var loginCaped = login.inCaps;
    await retAuth.then((res) {
      List<dynamic> data = res.data;
      var userData =
          data.firstWhere((element) => element["email"] == loginCaped);
      if (userData != null) {
        StorageHelper.set(StorageKeys.uid, "${userData["id"]}");
        response.statusCode = res.statusCode ?? 200;
        response.data = UserMapper.fromJson(userData);
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
    final storageUid = await StorageHelper.get(StorageKeys.uid);
    late HttpResponse response = HttpResponse();
    if (storageUid != null) {
      final String url = endpoints.login.allAuth;
      final retAuth = client.get(url + '/' + storageUid);
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
