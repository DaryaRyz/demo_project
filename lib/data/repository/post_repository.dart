import 'package:demo_project/data/rest_service.dart';
import 'package:demo_project/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPost();
}

class PostDataRepository implements PostRepository {
  final RestService restService;

  PostDataRepository({required this.restService});

  @override
  Future<List<Post>> getPost() async {
    final response = await restService.getPost();
    List<Post> result = [];
    for (var element in response) {
      result.add(Post.fromMap(element));
    }
    return result;
  }
}
