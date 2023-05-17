import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List myproduct = [];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle, color: Colors.transparent),
        // Shopping
        title: Text(
          "Shopping",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "category",
                      //   style: GoogleFonts.tiroGurmukhi(
                      //     textStyle: TextStyle(
                      //       fontSize: s.height * 0.03,
                      //       fontWeight: FontWeight.bold,
                      //       letterSpacing: 2,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: s.height * 0.01),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [],
                          //     children: ListView.builder(
                          //   itemBuilder: (context, index) {},
                          // )
                          // children: [
                          //   // GestureDetector(
                          //   //   onTap: () {},
                          //   //   child: Container(
                          //   //     height: s.height * 0.045,
                          //   //     width: s.width * 0.35,
                          //   //     decoration: const BoxDecoration(
                          //   //       color: Colors.black26,
                          //   //       borderRadius: BorderRadius.all(
                          //   //         Radius.circular(20),
                          //   //       ),
                          //   //     ),
                          //   //     // color: Colors.tealAccent.shade100,
                          //   //     alignment: Alignment.center,
                          //   //     child: Text(
                          //   //       "smartphones",
                          //   //       style: GoogleFonts.tiroGurmukhi(
                          //   //         textStyle: TextStyle(
                          //   //           fontSize: s.height * 0.02,
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //   ),
                          //   // ),
                          //   // SizedBox(width: s.width * 0.05),
                          //   // GestureDetector(
                          //   //   onTap: () {},
                          //   //   child: Container(
                          //   //     height: s.height * 0.05,
                          //   //     width: s.width * 0.35,
                          //   //     decoration: const BoxDecoration(
                          //   //       color: Colors.black26,
                          //   //       borderRadius: BorderRadius.all(
                          //   //         Radius.circular(20),
                          //   //       ),
                          //   //     ),
                          //   //     // color: Colors.tealAccent.shade100,
                          //   //     alignment: Alignment.center,
                          //   //     child: Text(
                          //   //       "laptops",
                          //   //       style: GoogleFonts.tiroGurmukhi(
                          //   //         textStyle: TextStyle(
                          //   //           fontSize: s.height * 0.02,
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //   ),
                          //   // ),
                          //   // SizedBox(width: s.width * 0.05),
                          //   // GestureDetector(
                          //   //   onTap: () {},
                          //   //   child: Container(
                          //   //     height: s.height * 0.05,
                          //   //     width: s.width * 0.35,
                          //   //     decoration: const BoxDecoration(
                          //   //       color: Colors.black26,
                          //   //       borderRadius: BorderRadius.all(
                          //   //         Radius.circular(20),
                          //   //       ),
                          //   //     ),
                          //   //     // color: Colors.tealAccent.shade100,
                          //   //     alignment: Alignment.center,
                          //   //     child: Text(
                          //   //       "fragrances",
                          //   //       style: GoogleFonts.tiroGurmukhi(
                          //   //         textStyle: TextStyle(
                          //   //           fontSize: s.height * 0.02,
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //   ),
                          //   // ),
                          //   // SizedBox(width: s.width * 0.05),
                          //   // GestureDetector(
                          //   //   onTap: () {},
                          //   //   child: Container(
                          //   //     height: s.height * 0.05,
                          //   //     width: s.width * 0.35,
                          //   //     decoration: const BoxDecoration(
                          //   //       color: Colors.black26,
                          //   //       borderRadius: BorderRadius.all(
                          //   //         Radius.circular(20),
                          //   //       ),
                          //   //     ),
                          //   //     // color: Colors.tealAccent.shade100,
                          //   //     alignment: Alignment.center,
                          //   //     child: Text(
                          //   //       "skincare",
                          //   //       style: GoogleFonts.tiroGurmukhi(
                          //   //         textStyle: TextStyle(
                          //   //           fontSize: s.height * 0.02,
                          //   //         ),
                          //   //       ),
                          //   //     ),
                          //   //   ),
                          //   // ),
                          // ],
                        ),
                      ),
                      SizedBox(height: s.height * 0.02),
                      SizedBox(
                        width: double.infinity,
                        height: s.height * 0.69,
                        child: GridView.builder(
                          itemCount: allproduct.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: (mycategory.isEmpty)
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(allroutes.productdetailpage, arguments: index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(20),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(allproduct[index].thumbnail),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : GridView(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        children: List.generate(mycategory.length, (index) {
                                          if (allproduct[index].category == mycategory) {
                                            return Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: s.width * 0.2,
                                                    height: s.height * 0.05,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(allproduct[index].thumbnail), fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Text(allproduct[index].thumbnail),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        }),
                                      ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 20,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      SizedBox(width: s.width * 0.02),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: s.height * 0.01),
                                          Text(
                                            "\$ ${allproduct[index].price}",
                                            style: GoogleFonts.tiroGurmukhi(
                                              textStyle: TextStyle(
                                                fontSize: s.height * 0.02,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            allproduct[index].brand,
                                            style: GoogleFonts.tiroGurmukhi(
                                              textStyle: TextStyle(
                                                fontSize: s.height * 0.015,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            allproduct[index].title,
                                            style: GoogleFonts.tiroGurmukhi(
                                              textStyle: TextStyle(
                                                fontSize: s.height * 0.011,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: s.height * 0.015),
            Container(
              height: s.height * 0.064,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.menupage);
                    },
                    icon: const Icon(
                      Icons.menu_rounded,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.favouritproductsepage);
                    },
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.cartpage);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.userinfopage);
                    },
                    icon: const Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
