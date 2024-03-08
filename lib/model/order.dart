import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/model/cart.dart';

class Order {
  final List<Cart> items;
  final String address;
  final double totalAmount;

  Order(
      {required this.items, required this.address, required this.totalAmount});
}


