import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:invoice_app/utils/routes_utils.dart';

class invoice_splash_page extends StatefulWidget {
  const invoice_splash_page({Key? key}) : super(key: key);

  @override
  State<invoice_splash_page> createState() => _invoice_splash_page();
}

class _invoice_splash_page extends State<invoice_splash_page> {
  double scal = 1;
  double trax = 1;
  double tray = 1;

  FlutterLogoStyle aniestyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        setState(() {
          aniestyle = FlutterLogoStyle.horizontal;
        });
        Navigator.of(context).pushReplacementNamed(allroutes.homepage);
        timer.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // const Spacer(flex: 1),
            Center(
              child: SpinKitWaveSpinner(
                size: 350,
                color: Colors.indigo.withOpacity(0.5),
                waveColor: Colors.indigoAccent.withOpacity(0.2),
                trackColor: Colors.blue.withOpacity(0.3),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 55),
                Column(
                  children: [
                    const SizedBox(height: 272),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.dribbble.com/users/1465772/screenshots/5726748/____dri.gif"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SpinKitWave(
                      size: 90,
                      color: Colors.indigo.withOpacity(0.3),
                    ),
                  ],
                ),
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
