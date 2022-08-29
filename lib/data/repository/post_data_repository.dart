import 'package:demo_project/data/repository/post_repository.dart';
import 'package:demo_project/data/rest_service.dart';
import 'package:demo_project/domain/models/post_models.dart';

class PostDataRepository implements PostRepository{
  final RestService restService;

  PostDataRepository({required this.restService});

  @override
  Future<List<PostModels>> getPost() async {
    final response = await restService.getPost();
    List<PostModels> result = [];
    for(var element in response){
      result.add(PostModels.fromMap(element));
    }
    return result;
  }

}