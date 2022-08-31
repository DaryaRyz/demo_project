import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  final String? title;
  final String? thumbnail;
  final VoidCallback onTap;

  const PostCard({
    Key? key,
    required this.title,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: ColorStyles.backgroundCardColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorStyles.borderCardColor,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: ColorStyles.shadowCardColor,
            blurRadius: 20,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: ColorStyles.primaryButtonColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (thumbnail != null)
              Align(
                alignment: Alignment.centerLeft,
                child: _ImagePostCard(thumbnail: thumbnail!),
              ),
            if (title != null)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: Text(
                    title!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorStyles.primaryFontColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ImagePostCard extends StatelessWidget {
  final String thumbnail;

  const _ImagePostCard({
    Key? key,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(5),
      ),
      child: Image.network(
        thumbnail,
        frameBuilder: (context, child, frame, isLoaded) {
          return Container(
            width: 120.w,
            color: ColorStyles.backgroundCardColor,
            child: child,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: ColorStyles.circularIndicatorColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => const SizedBox(),
      ),
    );
  }
}
