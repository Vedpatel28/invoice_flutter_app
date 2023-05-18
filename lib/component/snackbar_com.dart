import 'package:flutter/material.dart';

SnackBar errorsnackBar({required String text, required Color color}) {
  return SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(5),
        top: Radius.elliptical(50, 80),
      ),
    ),
    content: Text(text),
    elevation: 4,
    // margin: const EdgeInsets.all(20),
  );
}