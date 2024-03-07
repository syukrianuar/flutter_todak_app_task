import 'package:flutter/material.dart';
import 'package:todak_app_task/model/address.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(address.contactName),
      subtitle: Text(
          '${address.address}, ${address.city}, ${address.postcode}, ${address.state}'),
    );
  }
}
