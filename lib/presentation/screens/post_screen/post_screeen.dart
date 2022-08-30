import 'package:demo_project/domain/models/post.dart';
import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
      appBar: CustomAppBar.get(title: 'title'),
      body: Column(
        children: [],
      ),
    );
  }
}
