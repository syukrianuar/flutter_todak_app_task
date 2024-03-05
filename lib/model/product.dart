import 'package:todak_app_task/model/category.dart';

class Product {
  const Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercent,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.stock});

  final String id;
  final String title;
  final String description;
  final double price;
  final double discountPercent;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final int stock;
  // final Category category;
}
// "id": 1,
//             "title": "iPhone 9",
//             "description": "An apple mobile which is nothing like apple",
//             "price": 549,
//             "discountPercentage": 12.96,
//             "rating": 4.69,
//             "stock": 94,
//             "brand": "Apple",
//             "category": "smartphones",
//             "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
//             "images": [
//                 "https://cdn.dummyjson.com/product-images/1/1.jpg",
//                 "https://cdn.dummyjson.com/product-images/1/2.jpg",
//                 "https://cdn.dummyjson.com/product-images/1/3.jpg",
//                 "https://cdn.dummyjson.com/product-images/1/4.jpg",
//                 "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
//             ]