import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List myallproduct = [];

  bool viewchange = true;
  bool themechange = false;
  String filter = "";
  List<product?> filterallproduct = [];

  @override
  Widget build(BuildContext context) {
    ThemeData(
      useMaterial3: true,
    );
    ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
    themechange ? ThemeMode.dark : ThemeMode.light;
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                themechange = !themechange;
              });
            },
            icon: Icon(
              themechange
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "category",
                  style: GoogleFonts.tiroGurmukhi(
                    textStyle: TextStyle(
                      fontSize: s.height * 0.03,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: mycategory
                      .map(
                        (c) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              filter = c;
                              filterallproduct = allproduct.map((e) {
                                if (e.category == c) {
                                  return e;
                                }
                              }).toList();
                              filterallproduct
                                  .removeWhere((element) => element == null);
                            });
                          },
                          child: Text(c),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Expanded(
              flex: 13,
              child: (filter.isEmpty)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        // crossAxisSpacing: 5,
                        // mainAxisSpacing: 5,
                      ),
                      itemCount: allproduct.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              allroutes.productdetailpage,
                              arguments: index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: s.height * 0.17,
                                  width: s.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.elliptical(120, 20),
                                      bottom: Radius.elliptical(0, 200),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            allproduct[index].thumbnail),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "     ${allproduct[index].category}",
                              style: GoogleFonts.tiroGurmukhi(
                                textStyle: TextStyle(
                                  fontSize: s.height * 0.025,
                                ),
                              ),
                            ),
                            Text(
                              "     \$ ${allproduct[index].price}",
                              style: GoogleFonts.tiroGurmukhi(
                                textStyle: TextStyle(
                                  fontSize: s.height * 0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 2 / 3,
                      ),
                      children: List.generate(
                        filterallproduct.length,
                        (index) {
                          if (filterallproduct[index]!.category == filter) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(allroutes.productdetailpage);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: s.height * 0.17,
                                        width: s.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.elliptical(120, 20),
                                            bottom: Radius.elliptical(0, 200),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                filterallproduct[index]!
                                                    .thumbnail),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: s.height * 0.02),
                                  Text(
                                    "     ${filterallproduct[index]!.category}",
                                    style: GoogleFonts.tiroGurmukhi(
                                      textStyle: TextStyle(
                                        fontSize: s.height * 0.02,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "     \$ ${allproduct[index].price}",
                                    style: GoogleFonts.tiroGurmukhi(
                                      textStyle: TextStyle(
                                        fontSize: s.height * 0.02,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
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
        index: 0,
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
                Navigator.of(context)
                    .pushNamed(allroutes.cartpage, arguments: index);
              },
              child: const Icon(Icons.shopping_cart_outlined, size: 30)),
        ],
      ),
    );
  }
}

// Ori

//       SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Stack(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "category",
//                         style: GoogleFonts.tiroGurmukhi(
//                           textStyle: TextStyle(
//                             fontSize: s.height * 0.03,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 2,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: s.height * 0.01),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 height: s.height * 0.045,
//                                 width: s.width * 0.35,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20),
//                                   ),
//                                 ),
//                                 // color: Colors.tealAccent.shade100,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "smartphones",
//                                   style: GoogleFonts.tiroGurmukhi(
//                                     textStyle: TextStyle(
//                                       fontSize: s.height * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: s.width * 0.05),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 height: s.height * 0.05,
//                                 width: s.width * 0.35,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20),
//                                   ),
//                                 ),
//                                 // color: Colors.tealAccent.shade100,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "laptops",
//                                   style: GoogleFonts.tiroGurmukhi(
//                                     textStyle: TextStyle(
//                                       fontSize: s.height * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: s.width * 0.05),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 height: s.height * 0.05,
//                                 width: s.width * 0.35,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20),
//                                   ),
//                                 ),
//                                 // color: Colors.tealAccent.shade100,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "fragrances",
//                                   style: GoogleFonts.tiroGurmukhi(
//                                     textStyle: TextStyle(
//                                       fontSize: s.height * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: s.width * 0.05),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 height: s.height * 0.05,
//                                 width: s.width * 0.35,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(20),
//                                   ),
//                                 ),
//                                 // color: Colors.tealAccent.shade100,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "skincare",
//                                   style: GoogleFonts.tiroGurmukhi(
//                                     textStyle: TextStyle(
//                                       fontSize: s.height * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: s.height * 0.02),
//                       Container(
//                         width: double.infinity,
//                         height: s.height * 0.68,
//                         decoration: const BoxDecoration(
//                             // color: Colors.lightBlueAccent,
//                             ),
//                         child: GridView.builder(
//                           itemCount: allallproduct.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             childAspectRatio: 2 / 3,
//                             crossAxisCount: 2,
//                           ),
//                           itemBuilder: (context, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pushNamed(
//                                   allroutes.allproductdetailpage,
//                                   arguments: index);
//                             },
//                             child: Column(
//                               children: [
//                                 // Image Expanded & thumbnail
//
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     height: s.height * 0.2,
//                                     width: s.width,
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.all(
//                                         Radius.circular(20),
//                                       ),
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               allallproduct[index].thumbnail),
//                                           fit: BoxFit.cover),
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ),
//
//                                 SizedBox(height: s.height * 0.01),
//
//                                 // allproduct Detail Expanded
//
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     height: s.height * 0.1,
//                                     width: s.width,
//                                     decoration: const BoxDecoration(
//                                       borderRadius: BorderRadius.horizontal(
//                                         left: Radius.elliptical(200, 140),
//                                         right: Radius.elliptical(200, 350),
//                                       ),
//                                       // color: Colors.black26,
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text("\$ ${allallproduct[index].price}",
//                                           style: GoogleFonts.tiroGurmukhi(
//                                             textStyle: TextStyle(
//                                               fontSize: s.height * 0.02,
//                                             ),
//                                           ),),
//                                         Text(allallproduct[index].brand,
//                                           style: GoogleFonts.tiroGurmukhi(
//                                             textStyle: TextStyle(
//                                               fontSize: s.height * 0.015,
//                                             ),
//                                           ),),
//                                         Text(allallproduct[index].title,
//                                           style: GoogleFonts.tiroGurmukhi(
//                                             textStyle: TextStyle(
//                                               fontSize: s.height * 0.015,
//                                             ),
//                                           ),),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         buttonBackgroundColor: Colors.lightBlueAccent.shade100,
//         backgroundColor: Colors.white,
//         color: Colors.indigoAccent.shade100,
//         height: 60,
//         index: 0,
//         items: [
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed(allroutes.homepage);
//               },
//               child: const Icon(Icons.home_filled, size: 30)),
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed(allroutes.userinfopage);
//               },
//               child: const Icon(Icons.account_circle_outlined, size: 30)),
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context)
//                     .pushNamed(allroutes.favouritallproductsepage);
//               },
//               child: const Icon(Icons.favorite, size: 30)),
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context)
//                     .pushNamed(allroutes.cartpage, arguments: index);
//               },
//               child: const Icon(Icons.shopping_cart_outlined, size: 30)),
//         ],
//       ),
//     );
//   }
// }

// GridView(
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// ),
// children: List.generate(
// mycategory.length,
// (index) {
// // ignore: unrelated_type_equality_checks
// if (allallproduct[index].category ==
// mycategory) {
// return Container(
// child: Column(
// children: [
// Container(
// width: s.width * 0.2,
// height: s.height * 0.05,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// allallproduct[
// index]
//     .thumbnail),
// fit: BoxFit.cover),
// ),
// ),
// ],
// ),
// );
// } else {
// return Container();
// }
// },
// ),
// ),

//
// (mycategory.isEmpty)
// ? Column(
// children: [
// Expanded(
// flex: 2,
// child: GestureDetector(
// onTap: () {
// Navigator.of(context).pushNamed(
// allroutes.allproductdetailpage,
// arguments: index);
// },
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// allallproduct[index]
//     .thumbnail),
// fit: BoxFit.cover,
// ),
// borderRadius:
// const BorderRadius.only(
// topLeft: Radius.circular(20),
// topRight: Radius.circular(20),
// bottomLeft:
// Radius.circular(10),
// bottomRight:
// Radius.circular(10),
// ),
// ),
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: SizedBox(
// height: 20,
// width: double.infinity,
// child: Row(
// children: [
// SizedBox(width: s.width * 0.02),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// SizedBox(
// height:
// s.height * 0.01),
// Text(
// "\$ ${allallproduct[index].price}",
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.02,
// ),
// ),
// ),
// Text(
// allallproduct[index].brand,
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.015,
// ),
// ),
// ),
// Text(
// allallproduct[index].title,
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.011,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// )
//     : Column(
// children: [
// Expanded(
// flex: 2,
// child: GestureDetector(
// onTap: () {
// Navigator.of(context).pushNamed(
// allroutes.allproductdetailpage,
// arguments: index);
// },
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// allallproduct[index]
//     .thumbnail),
// fit: BoxFit.cover,
// ),
// borderRadius:
// const BorderRadius.only(
// topLeft: Radius.circular(20),
// topRight: Radius.circular(20),
// bottomLeft:
// Radius.circular(10),
// bottomRight:
// Radius.circular(10),
// ),
// ),
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: SizedBox(
// height: 20,
// width: double.infinity,
// child: Row(
// children: [
// SizedBox(width: s.width * 0.02),
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// SizedBox(
// height:
// s.height * 0.01),
// Text(
// "\$ ${allallproduct[index].price}",
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.02,
// ),
// ),
// ),
// Text(
// allallproduct[index].brand,
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.015,
// ),
// ),
// ),
// Text(
// allallproduct[index].title,
// style: GoogleFonts
//     .tiroGurmukhi(
// textStyle: TextStyle(
// fontSize:
// s.height * 0.011,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),

// ooppen

// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:invoice_pr/modals/allproduct_modals.dart';
// import 'package:invoice_pr/utils/allproduct.dart';
// import 'package:invoice_pr/utils/allproduct.dart';
// import 'package:invoice_pr/utils/allproduct.dart';
// import 'package:invoice_pr/utils/splashscrren.dart';
// import 'package:invoice_pr/views/scrrens/Cart%20Page.dart';
// import 'package:invoice_pr/views/scrrens/Customer%20Info%20Page.dart';
// import 'package:invoice_pr/views/scrrens/Favourite%20allproducts%20Page.dart';
// import 'package:invoice_pr/views/scrrens/allproduct%20Detail%20Page.dart';
// import 'package:invoice_pr/views/scrrens/invoice%20Preview%20Page.dart';
// import 'modals/MyRoutes.dart';
//
// void main() {
//   runApp(
//     MyApp(),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isGrid = false;
//   bool isDark = false;
//   String filter = "";
//   List<allproduct?> filterallproduct = [];
//   CarouselController buttonCarouselController = CarouselController();
//   final List<String> carouseimage = [
//     "https://static.vecteezy.com/system/resources/previews/001/950/076/original/online-shopping-concept-smartphone-online-store-free-vector.jpg",
//     "https://www.chic.ae/wp-content/uploads/Top-5-Online-Shopping-Website-in-Dubai-UAE-2022-1.jpg",
//     "https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2022-07/parcel-paper-cartons-with-shopping-cart-logo-trolley-laptop-keyboard-min.jpg",
//     "https://bmkltsly13vb.compat.objectstorage.ap-mumbai-1.oraclecloud.com/cdn.dailymirror.lk/assets/uploads/image_efc2441e66.jpg",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       darkTheme: ThemeData(
//         useMaterial3: true,
//         brightness: Brightness.dark,
//       ),
//       initialRoute: MyRoutes.SplashScreenPage,
//       themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
//       routes: {
//         MyRoutes.SplashScreenPage: (context) => const splashscrren(),
//         MyRoutes.allproductDetailPage: (context) => const allproductDetailPage(),
//         MyRoutes.FavouriteallproductsPage: (context) =>
//         const FavouriteallproductsPage(),
//         MyRoutes.CartPage: (context) => const CartPage(),
//         MyRoutes.CustomerInfoPage: (context) => const CustomerInfoPage(),
//         MyRoutes.InvoicePreviewPage: (context) => const InvoicePreviewPage(),
//         MyRoutes.homepage: (context) => Builder(
//           builder: (context) {
//             // Size s = MediaQuery.of(context).size;
//             return Scaffold(
//               appBar: AppBar(
//                 actions: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Text(
//                         "♡",
//                         style: TextStyle(fontSize: 20),
//                       )),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isDark = !isDark;
//                       });
//                     },
//                     icon: Icon(isDark
//                         ? Icons.light_mode_outlined
//                         : Icons.dark_mode_outlined),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(Icons.shopping_cart),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//                 title: const Text(
//                   "HOMEPAGE",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black54),
//                 ),
//                 centerTitle: true,
//                 backgroundColor: Colors.cyan,
//               ),
//               body:
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//               Column(
//                 children: [
//                   CarouselSlider(
//                     options: CarouselOptions(),
//                     items: carouseimage
//                         .map((item) => Container(
//                       child: Center(
//                           child: Image.network(item,
//                               fit: BoxFit.cover, width: 1000)),
//                     ))
//                         .toList(),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Align(
//                       child: Text(
//                         "category",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       )),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: category
//                             .map(
//                               (c) => ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 filter = c;
//                                 filterallproduct = allproduct.map((e) {
//                                   if (e.category == c) {
//                                     return e;
//                                   }
//                                 }).toList();
//                                 filterallproduct.removeWhere(
//                                         (element) => element == null);
//                               });
//                             },
//                             child: Text(c),
//                           ),
//                         )
//                             .toList(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     flex: 13,
//                     child: (filter.isEmpty)
//                         ? GridView.builder(
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                       ),
//                       itemCount: allproduct.length,
//                       itemBuilder: (context, index) =>
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pushNamed(
//                                   MyRoutes.allproductDetailPage,
//                                   arguments: index);
//                             },
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 140,
//                                   width: 170,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             allproduct[index].thumbnail),
//                                         fit: BoxFit.fill),
//                                   ),
//                                 ),
//                                 Text(allproduct[index].category),
//                                 Text("${allproduct[index]!.price}"),
//                                 // Text("${allproduct[index]!.brand}"),
//                               ],
//                             ),
//                           ),
//                     )
//                         : GridView(
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                       ),
//                       children: List.generate(filterallproduct.length,
//                               (index) {
//                             if (filterallproduct[index]!.category ==
//                                 filter) {
//                               return Column(
//                                 children: [
//                                   Container(
//                                     height: 140,
//                                     width: 170,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               filterallproduct[index]!
//                                                   .thumbnail),
//                                           fit: BoxFit.fill),
//                                     ),
//                                   ),
//                                   Text(filterallproduct[index]!.category),
//                                   Text("${allproduct[index]!.price}"),
//                                   // Text("${allproduct[index]!.brand}"),
//                                 ],
//                               );
//                             } else {
//                               return Container();
//                             }
//                           }),
//                     ),
//                   ),
//                 ],
//               ),
//               backgroundColor: Colors.grey.shade200,
//             );
//           },
//         ),
//       },
//     );
//   }
// }
//
//
//
//
//
// package name:-
//
// carousel_slider: ^4.2.1

// CarouselSlider(
// options: CarouselOptions(),
// items: carouseimage
//     .map(
// (item) => Container(
// child: Center(
// child: Image.network(
// item,
// fit: BoxFit.cover,
// width: 1000,
// ),
// ),
// ),
// )
//     .toList(),
// ),
