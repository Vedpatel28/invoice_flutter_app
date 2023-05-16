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
    int inidex = ModalRoute.of(context)!.settings.arguments as int;
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
        child: Row(children: [],),
      ),
    );
  }
}
