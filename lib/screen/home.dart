import 'package:flutter/material.dart';
import 'package:todak_app_task/screen/products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'eShop',
          ),
        ),
        body: const ProductsScreen());
  }
}
