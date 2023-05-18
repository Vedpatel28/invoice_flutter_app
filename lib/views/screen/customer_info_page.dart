import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_app/component/snackbar_com.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:invoice_app/utils/product_utils.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class customer_info_page extends StatefulWidget {
  const customer_info_page({Key? key}) : super(key: key);

  @override
  State<customer_info_page> createState() => _customer_info_pageState();
}

class _customer_info_pageState extends State<customer_info_page> {
  ImagePicker imagepic = ImagePicker();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle, color: Colors.transparent),
        // Shopping
        title: Text(
          "User Info",
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
      body: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: s.height * 0.78,
                  width: s.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          initialValue: allGlobalvar.Fname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            allGlobalvar.Fname = newValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Name',
                          ),
                        ),
                        SizedBox(height: s.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          initialValue: allGlobalvar.Pnumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter The Address";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            allGlobalvar.Pnumber = newValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Phone Number',
                          ),
                        ),
                        SizedBox(height: s.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          initialValue: allGlobalvar.Email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter The Address";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            allGlobalvar.Email = newValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter E-mail',
                          ),
                        ),
                        SizedBox(height: s.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          initialValue: allGlobalvar.Address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter The Address";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            allGlobalvar.Address = newValue!;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Address',
                          ),
                        ),
                        SizedBox(height: s.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(allroutes.accountpage);
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();

                              allGlobalvar.allContact.add(
                                contacts(
                                  firstname: allGlobalvar.Fname,
                                  lastname: allGlobalvar.Lname,
                                  Contact: allGlobalvar.Pnumber,
                                  email: allGlobalvar.Email,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorsnackBar(
                                  text: "Successfully Add Contact",
                                  color: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorsnackBar(
                                    text: "Sum thing Error !!",
                                    color: Colors.redAccent),
                              );
                            }
                          },
                          clipBehavior: Clip.antiAlias,
                          child: Text(
                            "Login",
                            style: GoogleFonts.tiroGurmukhi(
                              textStyle: TextStyle(
                                fontSize: s.height * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
