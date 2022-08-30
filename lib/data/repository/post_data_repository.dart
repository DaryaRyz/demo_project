import 'package:demo_project/data/repository/post_repository.dart';
import 'package:demo_project/data/rest_service.dart';
import 'package:demo_project/domain/models/post.dart';

class PostDataRepository implements PostRepository{
  final RestService restService;

  PostDataRepository({required this.restService});

  @override
  Future<List<Post>> getPost() async {
    final response = await restService.getPost();
    List<Post> result = [];
    for(var element in response){
      result.add(Post.fromMap(element));
    }
    return result;
  }

}