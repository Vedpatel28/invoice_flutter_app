import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagr add
                Container(
                  height: s.height * 0.2,
                  width: s.width,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: s.height * 0.07,
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.grey,
                        foregroundImage: (allGlobalvar.image != null)
                            ? FileImage(allGlobalvar.image!)
                            : null,
                        child: const Text(
                          "ADD",
                        ),
                      ),
                      Container(
                        height: s.height * 0.04,
                        width: s.width * 0.08,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: FloatingActionButton(
                          elevation: 3,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                alignment: Alignment.center,
                                shadowColor: Colors.black,
                                shape: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: const Text(
                                  "Select For Add Image",
                                ),
                                icon: const Icon(
                                    Icons.add_photo_alternate_outlined),
                                elevation: 4,
                                buttonPadding: const EdgeInsets.all(12),
                                content: Container(
                                  height: s.height * 0.1,
                                  alignment: Alignment.center,
                                  child: const Text(
                                      "Click Camera 📷 Button For Add Live Photo.\n"
                                      "Click Gallery 🌌 Button For Add all ready Clicked Photo.\n"),
                                ),
                                actions: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      XFile? img = await imagepic.pickImage(
                                          source: ImageSource.camera);
                                      if (img != null) {
                                        setState(() {
                                          allGlobalvar.image = File(img.path);
                                        });
                                      }
                                    },
                                    label: const Text("Camera"),
                                    icon: const Icon(Icons.camera_alt_outlined),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      XFile? img = await imagepic.pickImage(
                                          source: ImageSource.gallery);
                                      if (img != null) {
                                        setState(() {
                                          allGlobalvar.image = File(img.path);
                                        });
                                      }
                                    },
                                    label: const Text("Gallery"),
                                    icon: const Icon(Icons.photo_library),
                                  ),
                                ],
                              ),
                            );
                          },
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                // first name
                const Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  initialValue: allGlobalvar.Fname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter First Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Fname = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // last name
                const Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  initialValue: allGlobalvar.Lname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Last name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Lname = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // phone number
                const Text(
                  "Phone number",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  initialValue: (allGlobalvar.Pnumber == null)
                      ? null
                      : allGlobalvar.Pnumber.toString(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Contect Number";
                    } else if (value.length < 10) {
                      return "Enter 10 Digits...";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Pnumber = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+91 9093839249",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
                // Email
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  initialValue: allGlobalvar.Email,
                  validator: (value) {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("All Done"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Error!!!")));
                    }
                  },
                  onSaved: (newValue) {
                    allGlobalvar.Email = newValue;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    errorBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: s.height * 0.02),
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
              child: const Icon(Icons.home_filled, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(allroutes.userinfopage);
              },
              child: const Icon(Icons.account_circle_outlined, size: 30)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(allroutes.favouritproductsepage);
              },
              child: const Icon(Icons.favorite, size: 30)),
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
