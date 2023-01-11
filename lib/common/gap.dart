import 'package:flutter/material.dart';

class Gap {
  Gap._();

  static SizedBox h(double width) {
    return SizedBox(
      width: width,
    );
  }

  static SizedBox v(double height) {
    return SizedBox(
      height: height,
    );
  }
}
