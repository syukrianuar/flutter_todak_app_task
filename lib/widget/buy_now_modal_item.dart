import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/cart.dart';
import 'package:todak_app_task/model/product.dart';
import 'package:todak_app_task/screen/carts.dart';

// final List<Cart> _listCarts = [];

class BuyNowModalItem extends StatefulWidget {
  const BuyNowModalItem({super.key, required this.product});

  final Product product;

  @override
  State<BuyNowModalItem> createState() => _BuyNowModalItemState();
}

class _BuyNowModalItemState extends State<BuyNowModalItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredQuantity = 1;

  void addCartProduct(Product product) {
    var existingItem = listCarts.firstWhere(
      (item) => item.product.id == product.id,
      // orElse: () => null
      orElse: () => Cart(
          product: product,
          // calculatedPrice: _enteredQuantity *
          //     widget.product.price *
          //     ((100 - widget.product.discountPercent) / 100)
              ),
    );

    print('existing quantity :${existingItem.quantity}');

    if (existingItem.quantity == 0) {
      print('quantity = 0');
      existingItem.quantity = _enteredQuantity;
      //   existingItem.quantity;
      // setState(() {
      //   listCarts.add(Cart(
      //     product: product,
      //     quantity: existingItem.quantity,
      //     // calculatedPrice: (existingItem.quantity) *
      //     //     widget.product.price *
      //     //     ((100 - widget.product.discountPercent) / 100),
      //   ));
      // });
      // setState(() {
      listCarts.add(existingItem);
      //   // });
    } else {
      //   // existingItem.quantity++;
      print('quantity bukan 0');
      existingItem.quantity = existingItem.quantity + _enteredQuantity;
      // setState(() {
      //   listCarts.add(Cart(
      //     product: product,
      //     quantity: existingItem.quantity,
      //     // calculatedPrice: (_enteredQuantity + existingItem.quantity) *
      //     //     widget.product.price *
      //     //     ((100 - widget.product.discountPercent) / 100),
      //   ));
      // });
    }

    // setState(() {
    //   listCarts.add(Cart(
    //     product: product,
    //     quantity: _enteredQuantity,
    //     calculatedPrice: _enteredQuantity *
    //         widget.product.price *
    //         ((100 - widget.product.discountPercent) / 100),
    //   ));
    // });
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartsScreen()));
  }

  void saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      addCartProduct(widget.product);
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
