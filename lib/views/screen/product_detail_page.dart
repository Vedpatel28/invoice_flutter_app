import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class product_detail_page extends StatefulWidget {
  const product_detail_page({Key? key}) : super(key: key);

  @override
  State<product_detail_page> createState() => _product_detail_pageState();
}

class _product_detail_pageState extends State<product_detail_page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "Product Info",
          style: GoogleFonts.varta(
            textStyle: TextStyle(
              fontSize: s.height * 0.035,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
        // Icons OF Like / Cart
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(allroutes.favouritproductsepage);
                },
                icon: Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.red.shade200,
                  size: s.height * 0.035,
                ),
              ),
              SizedBox(width: s.width * 0.001),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(allroutes.cartpage);
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  size: s.height * 0.035,
                ),
              ),
            ],
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            SizedBox(height: s.height * 0.04),
            Container(
              height: s.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network(
                      'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
                    ),
                    SizedBox(width: s.width * 0.02),
                    Image.network(
                      'https://i.dummyjson.com/data/products/1/2.jpg',
                    ),
                    SizedBox(width: s.width * 0.02),
                    Image.network(
                      'https://i.dummyjson.com/data/products/1/1.jpg',
                    ),
                    SizedBox(width: s.width * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
