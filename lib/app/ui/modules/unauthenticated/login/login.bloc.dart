import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/base/bloc_base.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:flutter_architecture/core/utils/validator.util.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with Validators{
  AuthRepository repository = inject<AuthRepository>();

  final _login = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");
  Function(String) get changeEmail => _login.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Stream<String> get login => _login.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(login, password, (e, p) => true);

  Future<bool> signIn() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    HttpResponse ret = await repository.login(_login.value, _password.value);
    setLoading(false);
    if (ret.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _login.close();
    _password.close();
  }
}
