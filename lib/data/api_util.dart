import 'package:demo_project/data/routes.dart';
import 'package:dio/dio.dart';

class ApiUtil{
  final Dio _dio = Dio();

  Future<List> getPost() async {
    final response = await _dio.get(Routes.getPost);
    return response.data["data"]["children"];
  }
}