class Order {
  const Order({
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

// class OrderBucket {
//   OrderBucket({required this.orders, });

 
//   final List<Order> orders;
 

//   double get totalOrders {
//     double sum = 0;

//     for (final order in orders) {
//       sum += order.totalAmount;
//     }

//     return sum;
//   }
// }
