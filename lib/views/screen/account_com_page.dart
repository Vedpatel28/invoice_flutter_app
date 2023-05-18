import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class account_com_page extends StatefulWidget {
  const account_com_page({Key? key}) : super(key: key);

  @override
  State<account_com_page> createState() => _account_com_pageState();
}

class _account_com_pageState extends State<account_com_page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "My Profile",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: s.height*0.1,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Name  :  ${allGlobalvar.Fname}",
                  style: GoogleFonts.tiroGurmukhi(
                    textStyle: TextStyle(
                      fontSize: s.height * 0.03,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: s.height*0.015),
            Container(
              height: s.height*0.1,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Contact No.  :  ${allGlobalvar.Pnumber}",
                  style: GoogleFonts.tiroGurmukhi(
                    textStyle: TextStyle(
                      fontSize: s.height * 0.03,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: s.height*0.015),
            Container(
              height: s.height*0.1,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "E-mail  :  ${allGlobalvar.Email}",
                  style: GoogleFonts.tiroGurmukhi(
                    textStyle: TextStyle(
                      fontSize: s.height * 0.03,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: s.height*0.015),
            Container(
              height: s.height*0.15,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Address  :  ${allGlobalvar.Address}",
                  style: GoogleFonts.tiroGurmukhi(
                    textStyle: TextStyle(
                      fontSize: s.height * 0.03,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.linear,
        color: Colors.indigoAccent.shade100,
        height: 60,
        index: 1,
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
                Navigator.of(context).pushNamed(allroutes.menupage);
              },
              child: const Icon(Icons.menu_rounded, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.cartpage);
              },
              child: const Icon(Icons.shopping_cart_outlined, size: 30)),
        ],
      ),
    );
  }
}
