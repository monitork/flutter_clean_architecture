import 'package:flutter_architecture/app/data/remote/auth.provider.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/app/domain/repositories/auth.repository.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';
import 'package:flutter_architecture/device/connection/connection.helper.dart';

class AuthRepository implements IAuthRepository {
  AuthProvider service = inject<AuthProvider>();

  @override
  Future<HttpResponse> login(String login, String password) async {
    HttpResponse response = HttpResponse();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await service.loginTest(login, password);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

  @override
  Future<HttpResponse> tryLogin() async {
    final hasConnection = await ConnectionHelper.hasConnection();
    HttpResponse response = HttpResponse();
    if (hasConnection) {
      response = await service.tryLogin();
    } else {
      response.message = "Device offline";
    }

    return response;
  }


}
