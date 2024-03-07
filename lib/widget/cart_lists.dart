import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/cart.dart';

class CartLists extends StatelessWidget {
  const CartLists({
    super.key,
    required this.carts,
    // required this.onRemoveOrder
  });

  final List<Cart> carts;
  // final void Function(Order order) onRemoveOrder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) {
          var cart = carts[index];
          var calcPrice = cart.quantity *
              cart.product.price *
              ((100 - cart.product.discountPercent) / 100);
          return Dismissible(
              key: ValueKey(carts[index]),
              background: Container(
                margin: Theme.of(context).cardTheme.margin,
                color: Theme.of(context).colorScheme.error.withOpacity(0.7),
              ),
              // onDismissed: (direction) {
              //   onRemoveOrder(carts[index]);
              // },
              child:
                  // ExpenseItem(expense: expenses[index])
                  Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: carts[index].product.thumbnail,
                      fit: BoxFit.cover,
                      height: 10.h,
                      width: 10.h,
                    ),
                    Text(carts[index].quantity.toString()),
                    Spacer(),
                    Text(
                        'RM ${calcPrice.toStringAsFixed(2)}')
                    // Text('RM ${carts[index].calculatedPrice.toStringAsFixed(2)}')
                  ],
                ),
              ));
        });
  
  }
}
