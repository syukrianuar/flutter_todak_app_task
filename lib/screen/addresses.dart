import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Align(
            child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                icon: Icon(Icons.add),
                label: Text('Add New Address')),
          )
        ],
      ),
    );
  }
}
