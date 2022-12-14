import 'package:demo_project/data/repository/post_repository.dart';
import 'package:demo_project/data/api_util.dart';
import 'package:demo_project/domain/bloc/post_bloc.dart';
import 'package:demo_project/presentation/screens/home_screen/widgets/post_card.dart';
import 'package:demo_project/presentation/screens/post_screen/post_screeen.dart';
import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:demo_project/presentation/widgets/error_body.dart';
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
      apiUtil: ApiUtil(),
    ),
  );

  @override
  void initState() {
    _postBloc.add(PostBlocInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Posts from Reddit'),
      body: BlocBuilder(
        bloc: _postBloc,
        builder: (context, state) {
          if (state is PostBlocLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorStyles.primaryOrangeColor,
              ),
            );
          } else if (state is PostBlocErrorState) {
            return ErrorBody(
              onTap: () {
                _postBloc.add(PostBlocInitialEvent());
              },
            );
          } else if (state is PostBlocReadyState) {
            return RefreshIndicator(
              color: ColorStyles.primaryOrangeColor,
              onRefresh: () async {
                _postBloc.add(PostBlocRefreshEvent());
                await Future.delayed(const Duration(milliseconds: 1000));
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                itemCount: state.posts.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) => PostCard(
                  post: state.posts[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(
                          post: state.posts[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
