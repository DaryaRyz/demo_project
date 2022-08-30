import 'package:demo_project/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPost();
}