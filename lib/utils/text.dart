import 'package:flipkart_ui_demo/constant/color_constant.dart';
import 'package:flutter/material.dart';

Text customText(
    {required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    int? maxLines,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    double? height}) {
  return Text(
    text,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
    maxLines: maxLines,
    textScaleFactor: 1,
    style: TextStyle(
      shadows: shadows,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    ),
  );
}

TextStyle customStyle(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextOverflow? overflow}) {
  return TextStyle(
    overflow: overflow,
    color: color ?? white,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decorationColor: Colors.grey,
    decorationThickness: 2,
    decorationStyle: TextDecorationStyle.solid,
    decoration: decoration,
  );
}

// Text outfitText(
//     {required String text,
//       Color? color,
//       double? fontSize,
//       FontWeight? fontWeight,
//       int? maxLines,
//       List<Shadow>? shadows,
//       TextAlign? textAlign,
//       double? height}) {
//   return Text(
//     text,
//     overflow: maxLines != null ? TextOverflow.ellipsis : null,
//     textAlign: textAlign,
//     maxLines: maxLines,
//     textScaleFactor: 1,
//     style: GoogleFonts.outfit(
//       textStyle: TextStyle(
//         shadows: shadows,
//         color: color,
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         height: height,
//       ),
//     ),
//   );
// }
