import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:todak_app_task/model/product_item.dart';

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  List<ProductItem> _productItems = [];
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    final List listData = json.decode(response.body)['products'];
    final List<ProductItem> loadedItems = listData
        .map((item) => ProductItem(
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

    setState(() {
      _productItems = loadedItems;
    });
    // print(listData);
    // final List<ProductItem> loadedItems = [];

    // for (final item in listData.entries) {
    //   loadedItems.add(ProductItem(
    //       id: item.value['id'].toString(),
    //       title: item.value['title'],
    //       description: item.value['description'],
    //       price: item.value['price'],
    //       discountPercent: item.value['discountPercentage'],
    //       rating: item.value['rating'],
    //       brand: item.value['brand'],
    //       category: item.value['category'],
    //       thumbnail: item.value['thumbnail'],
    //       stock: item.value['stock']));
    // }
    // setState(() {
    //   _productItems = loadedItems;
    // });
    // return listData;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _productItems.length,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            width: 42.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(1, 0))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: 15.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                _productItems[index].thumbnail),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.5.sp,
                          // fontWeight: FontWeight.w500
                        ),
                        child: Text(
                          _productItems[index].title,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.all(0.5.w),
                        color: Colors.yellow,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.5.sp,
                            // fontWeight: FontWeight.w500
                          ),
                          child: Text(
                            '${_productItems[index].discountPercent} off',
                          ),
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.5.sp,
                          // fontWeight: FontWeight.w500
                        ),
                        child: Text(
                          'RM ${_productItems[index].price}',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
