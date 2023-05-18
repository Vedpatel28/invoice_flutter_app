import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class favourite_product_page extends StatefulWidget {
  const favourite_product_page({Key? key}) : super(key: key);

  @override
  State<favourite_product_page> createState() => _favourite_product_pageState();
}

class _favourite_product_pageState extends State<favourite_product_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "Favourite Product",
          style: GoogleFonts.varta(
            textStyle: TextStyle(
              fontSize: s.height * 0.035,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: cartproductadd.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: s.height * 0.01),
              Container(
                width: s.width,
                height: s.height * 0.14,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(favouriteproducts[index].thumbnail),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                width: s.width * 0.04,
              ),
              // Product Title / Product Price
              Text(
                favouriteproducts[index].title,
                style: GoogleFonts.tiroGurmukhi(
                  textStyle: TextStyle(
                    fontSize: s.height * 0.015,
                  ),
                ),
              ),
              // Product Price
              Text(
                "\$ ${favouriteproducts[index].price}",
                style: GoogleFonts.tiroGurmukhi(
                  textStyle: TextStyle(
                    fontSize: s.height * 0.02,
                  ),
                ),
              ),
              SizedBox(width: s.width * 0.01),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.linear,
        color: Colors.indigoAccent.shade100,
        height: 60,
        index: 2,
        items: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.homepage);
              },
              child: const Icon(Icons.home_filled, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.userinfopage);
              },
              child: const Icon(Icons.account_circle_outlined, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.favouritproductsepage);
              },
              child: const Icon(Icons.favorite, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.cartpage, arguments: index);
              },
              child: const Icon(Icons.shopping_cart_outlined, size: 30)),
        ],
      ),
    );
  }
}
