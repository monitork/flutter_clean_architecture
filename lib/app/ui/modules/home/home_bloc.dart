import 'package:flutter_architecture/app/domain/entities/user.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/core/base/base_bloc.dart';

class HomeBloc extends BaseBloc {
  final AuthService _authService;

  HomeBloc(this._authService);

  User? get currentUser => _authService.currentUser;
}
