
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class menu_page extends StatefulWidget {
  const menu_page({Key? key}) : super(key: key);

  @override
  State<menu_page> createState() => _menu_pageState();
}

class _menu_pageState extends State<menu_page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "Menu",
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: s.height*0.7,
              width: s.width,
              decoration: const BoxDecoration(),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // HOME
                    Row(
                      children: [
                        Text(
                          "Home",
                          style: GoogleFonts.tiroGurmukhi(
                            textStyle: TextStyle(
                              fontSize: s.height * 0.025,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pushNamed(allroutes.homepage);}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
                      ],
                    ),
                    const Divider(thickness: 2),
                    // Favourite
                    Row(
                      children: [
                        Text(
                          "Favourite",
                          style: GoogleFonts.tiroGurmukhi(
                            textStyle: TextStyle(
                              fontSize: s.height * 0.025,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pushNamed(allroutes.favouritproductsepage,arguments: index);}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
                      ],
                    ),
                    const Divider(thickness: 2),
                    // Cart
                    Row(
                      children: [
                        Text(
                          "Cart",
                          style: GoogleFonts.tiroGurmukhi(
                            textStyle: TextStyle(
                              fontSize: s.height * 0.025,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pushNamed(allroutes.cartpage,arguments: index);}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
                      ],
                    ),
                    const Divider(thickness: 2),
                    // User Info
                    Row(
                      children: [
                        Text(
                          "User Info",
                          style: GoogleFonts.tiroGurmukhi(
                            textStyle: TextStyle(
                              fontSize: s.height * 0.025,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pushNamed(allroutes.userinfopage);}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
                      ],
                    ),
                    const Divider(thickness: 2),
                    // Invoice
                    Row(
                      children: [
                        Text(
                          "Invoice",
                          style: GoogleFonts.tiroGurmukhi(
                            textStyle: TextStyle(
                              fontSize: s.height * 0.025,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pushNamed(allroutes.invoicepage);}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
                      ],
                    ),
                    const Divider(thickness: 2),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: s.height * 0.01,
            // ),
            // Container(
            //   height: s.height * 0.1,
            //   width: s.width,
            //   // color: Colors.lightBlueAccent,
            //   child: Column(
            //     children: [
            //       // HOME
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           children: [
            //             Text(
            //               "Cart",
            //               style: GoogleFonts.tiroGurmukhi(
            //                 textStyle: TextStyle(
            //                   fontSize: s.height * 0.025,
            //                 ),
            //               ),
            //             ),
            //             const Spacer(),
            //             IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
            //           ],
            //         ),
            //       ),
            //       // const Divider(thickness: 2),
            //       // Favourite
            //       // Row(
            //       //   children: [
            //       //     Text(
            //       //       "Favourite",
            //       //       style: GoogleFonts.tiroGurmukhi(
            //       //         textStyle: TextStyle(
            //       //           fontSize: s.height * 0.025,
            //       //         ),
            //       //       ),
            //       //     ),
            //       //     const Spacer(),
            //       //     IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next,size: s.height*0.05,),),
            //       //   ],
            //       // ),
            //       // const Divider(thickness: 2),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: s.height * 0.01,
            // ),
            // Container(
            //   height: s.height * 0.1,
            //   width: s.width,
            //   color: Colors.blue,
            // ),
            // SizedBox(
            //   height: s.height * 0.01,
            // ),
            // Container(
            //   height: s.height * 0.1,
            //   width: s.width,
            //   color: Colors.cyanAccent,
            // ),
          ],
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
