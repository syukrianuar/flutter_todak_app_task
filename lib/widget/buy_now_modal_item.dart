import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/order.dart';
import 'package:todak_app_task/model/product.dart';
import 'package:todak_app_task/screen/carts.dart';

// final List<Order> _listOrders = [];

class BuyNowModalItem extends StatefulWidget {
  const BuyNowModalItem({super.key, required this.product});

  final Product product;

  @override
  State<BuyNowModalItem> createState() => _BuyNowModalItemState();
}

class _BuyNowModalItemState extends State<BuyNowModalItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredQuantity = 1;

  void addCartProduct() {
    setState(() {
      listOrders.add(Order(
        id: widget.product.id,
        title: widget.product.title,
        thumbnail: widget.product.thumbnail,
        quantity: _enteredQuantity,
        calculatedPrice: _enteredQuantity *
            widget.product.price *
            ((100 - widget.product.discountPercent) / 100),
      ));
    });

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartsScreen()));
  }

  void saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      addCartProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 50.h,
        width: double.infinity,
        padding: EdgeInsets.all(4.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.product.thumbnail,
                    fit: BoxFit.fill,
                    height: 18.h,
                    width: 35.w,
                  ),
                  Column(
                    children: [
                      Text(widget.product.price.toString()),
                      Text('Stock: ${widget.product.stock}')
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
              ElevatedButton(onPressed: saveItem, child: Text('Add Now'))
            ],
          ),
        ),
      ),
    );
  }
}
