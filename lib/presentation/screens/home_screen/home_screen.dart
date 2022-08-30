import 'package:demo_project/data/repository/post_data_repository.dart';
import 'package:demo_project/data/rest_service.dart';
import 'package:demo_project/domain/bloc/post_bloc.dart';
import 'package:demo_project/presentation/styles/color_styles.dart';
import 'package:demo_project/presentation/widgets/custom_app_bar.dart';
import 'package:demo_project/presentation/widgets/error_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
