import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/model/cart.dart';
import 'package:todak_app_task/model/order.dart';
import 'package:todak_app_task/repository/address_repository.dart';
import 'package:todak_app_task/screen/addresses.dart';
import 'package:todak_app_task/util/get_sharedprefs.dart';
import 'package:todak_app_task/widget/cart_lists.dart';
import 'package:todak_app_task/widget/empty_state.dart';

List<Cart> listCarts = [];

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  // List<OrderBucket> buckets = [];

  String fullDefaultAddress = '';

  double get maxTotalCarts {
    double maxTotalCart = 0;

    for (final cart in listCarts) {
      maxTotalCart += cart.product.price *
          cart.quantity *
          ((100 - cart.product.discountPercent) / 100);
    }
    return maxTotalCart;
  }

  checkout() {
    double totalAmount = maxTotalCarts;

    Order order = Order(
        items: List.from(listCarts),
        totalAmount: totalAmount,
        address: fullDefaultAddress);
    
    listCarts.clear();
    return order;
  }

  

  @override
  Widget build(BuildContext context) {
    var sum = 0.0;
    Widget mainContent = Center(
      child: EmptyStateScreen(
        animationUrl: 'assets/empty_new.json',
        caption:
            'No item in the cart for now. Please add item from the list first.',
      ),
    );

    if (listCarts.isNotEmpty) {
      mainContent = CartLists(
        carts: listCarts,
        // onRemoveOrder: ,
        //   expenses: _registeredExpenses, onRemoveExpense: _removeExpense
      );
      
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
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
                fullDefaultAddress =
                    '${defaultAddress.address}, ${defaultAddress.city}, ${defaultAddress.postcode}, ${defaultAddress.state}';
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
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
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => AddressesScreen()))
                                .then((value) {
                              setState(() {});
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          title: Text(defaultAddress.contactName),
                          subtitle: Text(
                              '${defaultAddress.address}, ${defaultAddress.city}, ${defaultAddress.postcode}, ${defaultAddress.state}'),
                          trailing: Icon(Icons.navigate_next)),
                    ],
                  ),
                );
              }
            },
          ),

          SizedBox(
            height: 1.h,
          ),
          Expanded(child: mainContent)
          // Expanded(child: mainContent),
        ],
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Text('Total : '),
            Text(
              'RM ${maxTotalCarts.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: checkout,
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
                    backgroundColor:
                        Theme.of(context).colorScheme.onBackground),
                child: Text(
                  'Check Out',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ))
          ],
        ),
        // SizedBox(
        //   width: Adaptive.sw(39),
        // ),
      ],
    );
  }
}
