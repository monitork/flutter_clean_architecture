import 'package:flutter_architecture/app/domain/entities/http_response.dart';

abstract class IAuthRepository {
  Future<HttpResponse> login(String login, String password);
  Future<HttpResponse> tryLogin();
}