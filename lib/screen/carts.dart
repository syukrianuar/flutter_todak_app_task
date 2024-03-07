import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/model/cart.dart';
import 'package:todak_app_task/repository/address_repository.dart';
import 'package:todak_app_task/util/get_sharedprefs.dart';
import 'package:todak_app_task/widget/cart_lists.dart';

List<Cart> listCarts = [];

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  // List<OrderBucket> buckets = [];

  double get maxTotalCarts {
    double maxTotalCart = 0;

    for (final cart in listCarts) {
      maxTotalCart += cart.calculatedPrice;
    }
    return maxTotalCart;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
          'No item in the cart for now. Please add item from the list first.'),
    );

    if (listCarts.isNotEmpty) {
      mainContent = CartLists(
        carts: listCarts,
        // onRemoveOrder: ,
        //   expenses: _registeredExpenses, onRemoveExpense: _removeExpense
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          FutureBuilder<Address?>(
            future: AddressRepository().fetchSingleDefaultAddress(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                Address? defaultAddress = snapshot.data;
                if (defaultAddress == null) {
                  return Center(child: Text('No default address set'));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Default Address:',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(defaultAddress.contactName),
                        subtitle: Text(
                            '${defaultAddress.address}, ${defaultAddress.city}, ${defaultAddress.postcode}, ${defaultAddress.state}'),
                        trailing: Icon(Icons.navigate_next)),
                  ],
                );
              }
            },
          ),
          mainContent,
        ],
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Text('Total : '),
            Text(
              'RM ${maxTotalCarts.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 17, color: Colors.blue),
            ),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Check Out'))
          ],
        ),
        // SizedBox(
        //   width: Adaptive.sw(39),
        // ),
      ],
    );
  }
}
