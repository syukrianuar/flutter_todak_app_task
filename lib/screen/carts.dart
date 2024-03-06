import 'package:flutter/material.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
          'No item in the cart for now. Please add item from the list first.'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: mainContent,
    );
  }
}
