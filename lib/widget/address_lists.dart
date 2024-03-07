import 'package:flutter/material.dart';
import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/widget/address_item.dart';

class AddressLists extends StatelessWidget {
  const AddressLists({super.key, required this.addresses});

  final List<Address> addresses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: addresses.length,
          itemBuilder: (ctx, index) {
            return AddressItem(
              address: addresses[index],
            );
          }),
    );
  }
}
