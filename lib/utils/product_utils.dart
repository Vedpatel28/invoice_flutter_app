import 'dart:io';

import 'package:invoice_app/modal/pro_modals.dart';

class product {
  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final String thumbnail;

   int qunt = 1;
  // final List images;

  product({
    required this.id,
    required this.brand,
    required this.category,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.title,
    // required this.images,
  });

  factory product.fromMap({required Map data}) {
    return product(
      id: data['id'],
      brand: data['brand'],
      category: data['category'],
      description: data['description'],
      price: data['price'],
      thumbnail: data['thumbnail'],
      title: data['title'],
      // images: data['images'],
    );
  }
}

int addcartproduct = 1;

int addfavouritproduct = 1;

List<product> cartproductadd = [];

List<product> favouriteproducts = [];

int index = allproduct.length;


class allGlobalvar {
  static File? image;
  static String? Fname;
  static String? Lname;
  static String? Email;
  static String? Pnumber;
}