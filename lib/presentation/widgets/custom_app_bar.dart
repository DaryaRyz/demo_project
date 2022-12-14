import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorStyles.backgroundAppBarColor,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.r,
      ),
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
