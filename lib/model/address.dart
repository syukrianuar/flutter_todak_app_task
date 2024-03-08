import 'dart:convert';

class Address {
  Address(
      {required this.contactName,
      required this.address,
      required this.city,
      required this.postcode,
      required this.state,
      this.isDefault = false});
  final String contactName;
  final String address;
  final String city;
  final int postcode;
  final String state;
  bool isDefault;

  Map<String, dynamic> toMap() {
    return {
      'contact_name': contactName,
      'address': address,
      'city': city,
      'postcode': postcode,
      'state': state,
      'isDefault': isDefault,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      contactName: map['contact_name'],
      address: map['address'],
      city: map['city'],
      postcode: map['postcode'],
      state: map['state'],
      isDefault: map['isDefault'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
