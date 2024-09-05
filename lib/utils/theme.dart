import 'package:flipkart_ui_demo/constant/color_constant.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: buildMaterialColor(primaryColor),
    primaryColor: primaryColor,
    // fontFamily: GoogleFonts.outfit().fontFamily,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: backGround,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: buildMaterialColor(primaryColor),
    primaryColor: primaryColor,
    // fontFamily: GoogleFonts.outfit().fontFamily,
    scaffoldBackgroundColor: backGround,
    colorScheme: darkColorScheme,
  );
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
