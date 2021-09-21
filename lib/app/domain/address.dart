class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({required this.street,required  this.city,required  this.geo,required  this.suite,required this.zipcode});
}

class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});
}
