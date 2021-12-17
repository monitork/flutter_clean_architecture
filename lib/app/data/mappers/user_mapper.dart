import 'package:flutter_architecture/app/data/mappers/address_mapper.dart';
import 'package:flutter_architecture/app/data/mappers/company_mapper.dart';
import 'package:flutter_architecture/app/domain/entities/user.dart';

class UserMapper {
  static List<User> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      username: json["username"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String,
      website: json["website"] as String,
      address: AddressMapper.fromJson(json["address"]),
      company: CompanyMapper.fromJson(json["company"]),
    );
  }
}
