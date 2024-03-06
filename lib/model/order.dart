import 'package:todak_app_task/model/cart.dart';

class Order {
  const Order({required this.id, required this.orders});

  final String id;
  final List<Cart> orders;
}
