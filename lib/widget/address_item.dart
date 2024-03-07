// import 'package:flutter/material.dart';
// import 'package:todak_app_task/model/address.dart';

// class AddressItem extends StatefulWidget {
//   const AddressItem({super.key, required this.address, required this.onSetDefaultAddress});

//   final Address address;

//   final void Function(int index) onSetDefaultAddress;

//   @override
//   State<AddressItem> createState() => _AddressItemState();
// }

// class _AddressItemState extends State<AddressItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(widget.address.contactName),
//       subtitle: Text(
//           '${widget.address.address}, ${widget.address.city}, ${widget.address.postcode}, ${widget.address.state}'),
//       trailing: Checkbox(
//         value: widget.address.isDefault,
//         onChanged: (value) {
//           widget.onSetDefaultAddress(index);
//         },
//       ),
//     );
//   }
// }
