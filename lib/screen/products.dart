import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:todak_app_task/model/product.dart';
import 'package:todak_app_task/screen/product_details.dart';
import 'package:todak_app_task/widget/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];

  var isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _loadItems() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    try {
      final List listData = json.decode(response.body)['products'];
      if (response.statusCode == 200) {
        final List<Product> loadedItems = listData
            .map((item) => Product(
                id: item['id'].toString(),
                title: item['title'],
                description: item['description'],
                price: double.parse(item['price'].toString()),
                discountPercent:
                    double.parse(item['discountPercentage'].toString()),
                rating: double.tryParse(item['rating'].toString())!,
                brand: item['brand'],
                category: item['category'],
                thumbnail: item['thumbnail'],
                stock: item['stock']))
            .toList();

        if (!mounted) return;

        setState(() {
          _products = loadedItems;
          isLoading = false;
        });
      }
    } catch (e) {}
  }

  void _selectProduct(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(product: product)));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        itemCount: _products.length,
        itemBuilder: (ctx, index) {
          return ProductItem(
              product: _products[index], onSelectProduct: _selectProduct);
        });

    if (isLoading) {
      mainContent = Center(child: CircularProgressIndicator());
    }
    return mainContent;
  }
}
