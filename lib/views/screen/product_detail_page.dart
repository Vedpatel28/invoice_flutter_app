import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class product_detail_page extends StatefulWidget {
  const product_detail_page({Key? key}) : super(key: key);

  @override
  State<product_detail_page> createState() => _product_detail_pageState();
}

class _product_detail_pageState extends State<product_detail_page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery
        .of(context)
        .size;
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
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
                  Navigator.of(context).pushNamed(allroutes.cartpage,arguments: index);
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
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(height: s.height * 0.1),
            // product Preview
            Stack(
              children: [
                Container(
                  height: s.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // product Preview
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 1,
                    ),
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, indexin) =>
                        SizedBox(
                          height: s.height * 0.02,
                          width: s.width * 0.05,
                          child: SizedBox(
                            width: s.width * 0.2,
                            height: s.height * 0.2,
                            child: Image.network(
                              allproduct[index].thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  ),
                ),
                // Transform.translate(offset: const Offset(340, 160),child: IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next,size: s.height*0.05,color: Colors.black),)),
              ],
            ),
            SizedBox(height: s.height * 0.01),
            // Price & Add To cart
            Container(
              height: s.height * 0.11,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                // color: Colors.red
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$ ${allproduct[index].price}",
                        style: GoogleFonts.tiroGurmukhi(
                          textStyle: TextStyle(
                            fontSize: s.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          product.addcartproduct ++;
                          // product.cartproductadd.addAll(product(id: data['id'],
                          //     brand: data['brand'],
                          //     category: data['category'],
                          //     description: data['description'],
                          //     price: data['price'],
                          //     thumbnail: data['thumbnail'],
                          //     title: data['title']) as Iterable)
                          product.cartproductadd.add(product.addcartproduct);
                          Navigator.of(context).pushNamed(allroutes.cartpage, arguments: index);
                        },
                        icon: Icon(Icons.shopping_cart_outlined,
                            size: s.height * 0.04),
                      ),
                    ],
                  ),
                  Text(
                    allproduct[index].title,
                    style: GoogleFonts.tiroGurmukhi(
                      textStyle: TextStyle(
                        fontSize: s.height * 0.022,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description
            Text(
              allproduct[index].description,
              style: GoogleFonts.tiroGurmukhi(
                textStyle: TextStyle(
                  fontSize: s.height * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
