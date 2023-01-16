import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:wordpress_flutter/app/data/model/post_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<PostModel>> fetchPosts();
}
