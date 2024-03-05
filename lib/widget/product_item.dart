import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.product, required this.onSelectProduct});

  final Product product;
  final void Function(BuildContext context, Product product) onSelectProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectProduct(context, product);
      },
      child: Container(
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
                        image: CachedNetworkImageProvider(product.thumbnail),
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
                      product.title,
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
                        '${product.discountPercent} off',
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
                      'RM ${product.price}',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
