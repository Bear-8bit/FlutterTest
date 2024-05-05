import 'package:flutter/material.dart';

class ShadowStyle {
  static const verticalProductShadow = BoxShadow(
    color: Color.fromARGB(60, 0, 0, 0),
    blurRadius: 10,
    spreadRadius: 2,
    offset: Offset(1, 0)
  );

  static const horizontalProductShadow = BoxShadow(
    color: Color.fromARGB(60, 0, 0, 0),
    blurRadius: 10,
    spreadRadius: 2,
    offset: Offset(0, 2),
  );
}