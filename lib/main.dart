import 'package:flutter/material.dart';
import 'package:invoice_app/utils/routes_utils.dart';
import 'package:invoice_app/views/screen/cart_page.dart';
import 'package:invoice_app/views/screen/customer_info_page.dart';
import 'package:invoice_app/views/screen/favourite_products_page.dart';
import 'package:invoice_app/views/screen/homepage.dart';
import 'package:invoice_app/views/screen/invoice_preview_page.dart';
import 'package:invoice_app/views/screen/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        allroutes.homepage: (context) => const homepage(),
        allroutes.userinfopage: (context) => const customer_info_page(),
        allroutes.productdetailpage: (context) => const product_detail_page(),
        allroutes.cartpage: (context) => const cart_page(),
        allroutes.favouritproductsepage: (context) => const favourite_product_page(),
        allroutes.invoicepage: (context) => const invoice_preview_page(),
      },
    );
  }
}
