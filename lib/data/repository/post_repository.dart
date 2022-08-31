import 'package:demo_project/data/api_util.dart';
import 'package:demo_project/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPost();
}

class PostDataRepository implements PostRepository {
  final ApiUtil apiUtil;

  PostDataRepository({required this.apiUtil});

  @override
  Future<List<Post>> getPost() async {
    final response = await apiUtil.getPost();
    List<Post> result = [];
    for (var element in response) {
      result.add(Post.fromMap(element));
    }
    return result;
  }
}
