import 'package:demo_project/presentation/screens/home_screen/home_screen.dart';
import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: ColorStyles.backgroundColor,
          fontFamily: 'Lato',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
