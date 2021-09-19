import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/base/view_mode.base.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  AuthRepository repository = inject<AuthRepository>();

  final _login = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");

  Stream<String> get login => _login.stream;

  void setLogin(String value) => _login.add(value);

  Stream<String> get password => _password.stream;

  void setPassword(String value) => _password.add(value);

  Future<bool> signIn() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    HttpResponse ret = await repository.login(_login.value, _password.value);

    setLoading(false);

    if (ret.statusCode == 200) {
      clear();
      return true;
    }

    return false;
  }

  @override
  void clear() {
    _login.add("");
    _password.add("");
  }
}
