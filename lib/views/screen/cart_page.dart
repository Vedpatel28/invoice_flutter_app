import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "My Cart",
          style: GoogleFonts.varta(
            textStyle: TextStyle(
              fontSize: s.height * 0.035,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: cartproductadd.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              SizedBox(height: s.height * 0.01),
              // const Spacer(),
              Row(
                children: [
                  // product Image
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(cartproductadd[index].thumbnail),
                  ),
                  SizedBox(
                    width: s.width * 0.05,
                  ),
                  // Product Title / Product Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // product Title
                      Text(cartproductadd[index].title),
                      // Product Price
                      Text("\$ ${cartproductadd[index].price}"),
                    ],
                  ),
                  const Spacer(),
                  // Product Quantities
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            allproduct[index].price * addcartproduct;
                            if (cartproductadd[index].qunt < 1) {
                              cartproductadd.remove(cartproductadd[index]);
                            } else {
                              cartproductadd[index].qunt--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_rounded),
                      ),
                      Text("${cartproductadd[index].qunt}"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            cartproductadd[index].qunt++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
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
        index: 3,
        items: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.homepage);
              },
              child: const Icon(Icons.home_rounded, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.userinfopage);
              },
              child: const Icon(Icons.account_circle_outlined, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.menupage);
              },
              child: const Icon(Icons.menu_rounded, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.cartpage);
              },
              child: const Icon(Icons.shopping_cart_outlined, size: 30)),
        ],
      ),
    );
  }
}
