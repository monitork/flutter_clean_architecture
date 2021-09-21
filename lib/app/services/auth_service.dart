import 'package:flutter_architecture/app/domain/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final _auth = BehaviorSubject<User?>.seeded(null);

  Stream<User?> get auth => _auth.stream;

  Function(User) get setAuth => _auth.sink.add;
}
