class Cart {
  const Cart({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.quantity,
    required this.calculatedPrice,
    // required this.totalAmount,
  });

  final String id;
  final String title;
  final String thumbnail;
  final int quantity;
  final double calculatedPrice;
  // final double totalAmount;
}

class CartBucket {
  CartBucket({required this.carts, });

 
  final List<Cart> carts;
 

  double get totalcarts {
    double sum = 0;

    for (final cart in carts) {
      sum += cart.calculatedPrice;
    }

    return sum;
  }
}
