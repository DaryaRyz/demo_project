import 'dart:async';

import 'package:demo_project/data/repository/post_repository.dart';
import 'package:demo_project/domain/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class PostBloc extends Bloc<PostBlocEvent, PostBlocState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(PostBlocLoadingState()) {
    on<PostBlocInitialEvent>(_initialHandler);
    on<PostBlocRefreshEvent>(_refreshHandler);
  }

  FutureOr<void> _initialHandler(PostBlocInitialEvent event, emit) async {
    emit(PostBlocLoadingState());
    try {
      final postList = await repository.getPost();
      emit(PostBlocReadyState(posts: postList));
    } catch (error) {
      Logger().e(error);
      emit(PostBlocErrorState());
    }
  }

  FutureOr<void> _refreshHandler(PostBlocRefreshEvent event, emit) {}
}

abstract class PostBlocEvent {}

class PostBlocInitialEvent extends PostBlocEvent {}

class PostBlocRefreshEvent extends PostBlocEvent {}

abstract class PostBlocState {}

class PostBlocReadyState extends PostBlocState {
  final List<Post> posts;

  PostBlocReadyState({required this.posts});
}

class PostBlocErrorState extends PostBlocState {}

class PostBlocLoadingState extends PostBlocState {}
