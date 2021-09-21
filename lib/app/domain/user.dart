import 'package:flutter_architecture/app/domain/address.dart';
import 'package:flutter_architecture/app/domain/repositories/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  User(
      {required this.email,
      required this.phone,
      required this.website,
      required this.company,
      required this.address,
      required this.id,
      required this.username,
      required this.name});
}
