import 'package:flutter_architecture/app/domain/entities/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final _auth = BehaviorSubject<User?>.seeded(null);

  Stream<User?> get auth => _auth.stream;
  User? get currentUser => _auth.stream.value;

  Function(User?) get setAuth => _auth.sink.add;
}
