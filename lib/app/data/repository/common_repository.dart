import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/service/api_service/api_service.dart';

abstract class CommonRepository {
  Future<List<PostModel>> fetchPosts();
  Future<List<PostModel>> fetchPostsByCategory(List<int> data);
  Future<List<CategoryModel>> fetchCategories();
}

@LazySingleton(as: CommonRepository)
class CommonRepositoryImpl implements CommonRepository {
  final ApiService _apiService;
  CommonRepositoryImpl(this._apiService);

  @override
  Future<List<PostModel>> fetchPosts() {
    return _apiService.fetchPosts();
  }

  @override
  Future<List<PostModel>> fetchPostsByCategory(List<int> list) {
    return _apiService.fetchPostsByCategory(list);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() {
    return _apiService.fetchCategories();
  }
}
