import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar {
  static AppBar get({
    required String title,
    Widget? leading,
  }) {
    return AppBar(
      backgroundColor: ColorStyles.backgroundAppBarColor,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          color: ColorStyles.primaryFontColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
      elevation: 1,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Image.asset(
            'assets/images/logo.png',
            width: 35.r,
            height: 35.r,
          ),
        ),
      ],
    );
  }
}