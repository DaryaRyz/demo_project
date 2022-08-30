import 'package:demo_project/data/repository/post_data_repository.dart';
import 'package:demo_project/data/rest_service.dart';
import 'package:demo_project/domain/bloc/post_bloc.dart';
import 'package:demo_project/presentation/screens/home_screen/widgets/post_card.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _postBloc = PostBloc(
    repository: PostDataRepository(
      restService: RestService(),
    ),
  );

  @override
  void initState() {
    _postBloc.add(PostBlocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.get(title: 'Posts from Reddit'),
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
