import 'package:rxdart/subjects.dart';

abstract class BlocBase {
  final _loading = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loading => _loading.stream;

  void setLoading(bool value) => _loading.add(value);

  void dispose();
}
