import 'package:todak_app_task/model/product.dart';

class Cart {
  Cart({
    // required this.id,
    // required this.title,
    // required this.thumbnail,
    required this.product,
    this.quantity = 0,
    this.calculatedPrice =0.0,
    // required this.totalAmount,
  });

  // final String id;
  // final String title;
  // final String thumbnail;
  final Product product;
  int quantity;
  final double calculatedPrice;
  // final double totalAmount;
}

class CartBucket {
  CartBucket({
    required this.carts,
  });

  final List<Cart> carts;

  double get totalcarts {
     
    double sum = 0;

    for (final cart in carts) {
      sum += cart.calculatedPrice;
    }

    return sum;
  }
}
