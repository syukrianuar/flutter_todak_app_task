import 'package:flutter/material.dart';
import 'package:todak_app_task/model/address.dart';

class AddressLists extends StatelessWidget {
  const AddressLists(
      {super.key, required this.addresses, required this.onSetDefaultAddress});

  final List<Address> addresses;

  final void Function(int index) onSetDefaultAddress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: addresses.length,
          itemBuilder: (ctx, index) {
            var address = addresses[index];
            return ListTile(
                leading: Checkbox(
                  value: address.isDefault,
                  onChanged: (value) {
                    onSetDefaultAddress(index);
                  },
                ),
                title: Text(address.contactName),
                subtitle: Text(
                    '${address.address}, ${address.city}, ${address.postcode}, ${address.state}'),
                trailing: Icon(Icons.edit));
          }),
    );
  }
}
