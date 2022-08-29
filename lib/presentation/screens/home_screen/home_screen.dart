import 'package:demo_project/presentation/screens/home_screen/widgets/post_card.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.get(
        title: 'Posts from Reddit',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            PostCard(
              title:
                  'Helper Widgets for Making Adaptive Layouts in Flutter (AdaptiveScaffold)',
              thumbnail:
                  'https://b.thumbs.redditmedia.com/hDtblCTz8lmDmyrIxG5HJSY2RSReP6fDw2eqtssVAMg.jpg',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
