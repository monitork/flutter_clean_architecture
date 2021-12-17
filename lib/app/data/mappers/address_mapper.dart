import 'package:flutter_architecture/app/domain/entities/address.dart';

class AddressMapper {
  static Address fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        city: json['city'],
        geo: fromGeoJson(json['geo']),
        suite: json['suite'],
        zipcode: json['zipcode']);
  }

  static Geo fromGeoJson(Map<String, dynamic> json) {
    return Geo(lat: double.parse(json['lat']), lng: double.parse(json['lng']));
  }
}
