import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
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
    int index = ModalRoute.of(context)!.settings.arguments as int;
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
                  Navigator.of(context).pushNamed(allroutes.favouritproductsepage);
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
            SizedBox(height: s.height * 0.1),
            Container(
              height: s.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.builder(
                itemCount: allproduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 1,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: s.height * 0.02,
                  width: s.width * 0.05,
                  child: Image.network(
                    allproduct[index].images as String,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
