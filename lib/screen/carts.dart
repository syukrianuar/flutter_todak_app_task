import 'package:flutter/material.dart';
import 'package:todak_app_task/model/order.dart';
import 'package:todak_app_task/widget/cart_lists.dart';

List<Order> listOrders = [];

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
          'No item in the cart for now. Please add item from the list first.'),
    );

     if (listOrders.isNotEmpty) {
      mainContent = CartLists(
        orders: listOrders,
        // onRemoveOrder: ,
        //   expenses: _registeredExpenses, onRemoveExpense: _removeExpense
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: mainContent,
    );
  }
}
