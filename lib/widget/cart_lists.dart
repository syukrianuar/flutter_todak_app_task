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
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.w),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 0.3,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  carts[index].product.thumbnail),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(carts[index].product.title.toString()),
                          Text('x ${carts[index].quantity.toString()}'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'RM ${calcPrice.toStringAsFixed(2)}',
                    )
                    // Text('RM ${carts[index].calculatedPrice.toStringAsFixed(2)}')
                  ],
                ),
              ));
        });
  }
}
