import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/service/api_service/api_service.dart';

abstract class PostsRepository {
  Future<List<PostModel>> fetchPosts();
}

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final ApiService _apiService;
  PostsRepositoryImpl(this._apiService);

  @override
  Future<List<PostModel>> fetchPosts() {
    return _apiService.fetchPosts();
  }
}
