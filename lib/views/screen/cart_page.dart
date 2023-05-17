import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/product_utils.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
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
              Row(
                children: [
                  CircleAvatar(
                    foregroundImage: NetworkImage(cartproductadd[index].thumbnail),
                  ),
                  SizedBox(
                    width: s.width * 0.05,
                  ),
                  Text(cartproductadd[index].title),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (addcartproduct < 2) {
                              cartproductadd.remove(cartproductadd[index]);
                            }
                            addcartproduct--;
                          });
                        },
                        icon: const Icon(Icons.remove_rounded),
                      ),
                      Text("$addcartproduct"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            addcartproduct++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
