import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle,color: Colors.transparent),
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
                      SizedBox(height: s.height * 0.01),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: s.height * 0.045,
                              width: s.width * 0.35,
                              color: Colors.tealAccent.shade100,
                            ),
                            SizedBox(width: s.width * 0.05),
                            Container(
                              height: s.height * 0.05,
                              width: s.width * 0.35,
                              color: Colors.tealAccent.shade100,
                            ),
                            SizedBox(width: s.width * 0.05),
                            Container(
                              height: s.height * 0.05,
                              width: s.width * 0.35,
                              color: Colors.tealAccent.shade100,
                            ),
                            SizedBox(width: s.width * 0.05),
                            Container(
                              height: s.height * 0.05,
                              width: s.width * 0.35,
                              color: Colors.tealAccent.shade100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: s.height * 0.02),
                      SizedBox(
                        width: double.infinity,
                        height: s.height * 0.69,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(allroutes.productdetailpage);
                              },
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            );
                          },
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
                      size: 40,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(allroutes.favouritproductsepage);
                    },
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      size: 40,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.cartpage);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      size: 40,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(allroutes.userinfopage);
                    },
                    icon: const Icon(
                      Icons.account_circle,
                      size: 40,
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
