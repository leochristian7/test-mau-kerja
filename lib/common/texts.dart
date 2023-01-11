import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texts {
  Texts._();

  static Text text(
    final String text, {
    final Key? key,
    final double? size,
    final FontWeight? fontWeight,
    final Color? color,
    final TextAlign? textAlign,
    final int? maxLine = 1,
    final bool ellipsis = false,
    final double? verticalSpacing,
    final TextDecoration? decoration,
    final Color? decorationColor,
    final FontStyle? fontStyle,
    final double? wordSpacing,
    final double? letterSpacing,
    final TextStyle? textStyle,
  }) {
    return Text(
      text,
      key: key,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: ellipsis ? TextOverflow.ellipsis : null,
      style: GoogleFonts.k2d(
        fontSize: size ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
        height: verticalSpacing,
        decoration: decoration,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        decorationColor: decorationColor,
        fontStyle: fontStyle,
        textStyle: textStyle,
      ),
    );
  }
}
