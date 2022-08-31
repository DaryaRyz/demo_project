import 'package:demo_project/domain/models/post.dart';
import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  const PostScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: const CustomAppBar(title: 'Post'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (post.title != null)
                Text(
                  post.title!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: ColorStyles.primaryFontColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 60.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorStyles.backgroundPlusColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20.r,
                      ),
                      Text(
                        post.ups.toString(),
                        style: TextStyle(
                          color: ColorStyles.primaryFontColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              if (post.selfText != null)
                Text(
                  post.selfText!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: ColorStyles.primaryFontColor.withOpacity(0.6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
