import 'package:demo_project/domain/models/post_models.dart';

abstract class PostRepository {
  Future<List<PostModels>> getPost();
}