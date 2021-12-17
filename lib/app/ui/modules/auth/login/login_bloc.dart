import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/domain/entities/http_response.dart';
import 'package:flutter_architecture/app/domain/entities/user.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/core/base/base_bloc.dart';
import 'package:flutter_architecture/core/utils/validator.util.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc with Validators {
  final AuthRepository _repository;
  final AuthService _authState;
  final _login = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");

  LoginBloc(this._repository, this._authState);

  Stream<String> get login => _login.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(login, password, (email, password) {
        return true;
      });

  Function(String) get setLogin => _login.sink.add;

  Function(String) get setPassword => _password.sink.add;

  Future<bool> signIn() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    HttpResponse ret = await _repository.login(_login.value, _password.value);
    setLoading(false);
    if (ret.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future tryLogin() async {
    setLoading(true);
    HttpResponse ret = await _repository.tryLogin();

    setLoading(false);
    if (ret.statusCode == 200) {
      _authState.setAuth(ret.data as User);
      return true;
    }
    _authState.setAuth(null);
    return false;
  }

  @override
  void dispose() {
    _login.add("");
    _password.add("");
  }
}
