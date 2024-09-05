import 'package:flipkart_ui_demo/constant/color_constant.dart';
import 'package:flipkart_ui_demo/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customButton(
    {required VoidCallback onTap, required String title, Color? buttonColor}) {
  return Material(
    borderRadius: BorderRadius.circular(2),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2),
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: customText(
              text: title,
              color: black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}

Widget customTextButton({
  required VoidCallback onTap,
  required String title,
}) {
  return Material(
    borderRadius: BorderRadius.circular(2),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.blueGrey),
        ),
        child: Center(
          child: customText(
              text: title,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}
