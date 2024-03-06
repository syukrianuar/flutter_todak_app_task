import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/product.dart';

class BuyNowModalItem extends StatelessWidget {
  const BuyNowModalItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var _enteredQuantity = 1;
    return Container(
      height: 40.h,
      width: double.infinity,
      padding: EdgeInsets.all(4.h),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: product.thumbnail,
                fit: BoxFit.fill,
                height: 18.h,
                width: 35.w,
              ),
              Column(
                children: [
                  Text(product.price.toString()),
                  Text('Stock: ${product.stock}')
                ],
              )
            ],
          ),
          Row(
            children: [
              Text('Quantity'),
              Spacer(),
              SizedBox(
                width: 20.w,
                child: TextFormField(
                  initialValue: _enteredQuantity.toString(),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null ||
                        int.tryParse(value)! <= 0) {
                      return 'Must be valid, positive number.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredQuantity = int.parse(value!);
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Add Now'))
        ],
      ),
    );
  }
}
