import 'package:flutter_architecture/app/domain/entities/company.dart';

class CompanyMapper {
  static List<Company> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static Company fromJson(Map<String, dynamic> json) {
    return Company(
        name: json["name"], catchPhrase: json["catchPhrase"], bs: json["bs"]);
  }
}
