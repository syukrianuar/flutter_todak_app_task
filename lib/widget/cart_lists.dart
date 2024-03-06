import 'package:flutter/material.dart';
import 'package:todak_app_task/model/order.dart';

class CartLists extends StatelessWidget {
  const CartLists({super.key, required this.orders, 
  // required this.onRemoveOrder
  });

  final List<Order> orders;
  // final void Function(Order order) onRemoveOrder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(orders[index]),
            background: Container(
              margin: Theme.of(context).cardTheme.margin,
              color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            ),
            // onDismissed: (direction) {
            //   onRemoveOrder(orders[index]);
            // },
            child:
                // ExpenseItem(expense: expenses[index])
                Text(orders[index].quantity.toString())));
  }
}
