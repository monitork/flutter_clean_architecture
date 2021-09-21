import 'base_url.dart' as base_url;

class _Login {
  final allAuth = base_url.auth + "/users";
  final auth = base_url.auth;
}

class _MyList {
  final list = base_url.base + "/api/list";
}

final login = _Login();
final myList = _MyList();
