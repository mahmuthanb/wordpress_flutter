import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/repository/common_repository.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final CommonRepository commonRepository;
  HomePageCubit(this.commonRepository) : super(HomePageInitial()) {
    fetchCategories().then((value) {
      fetchPosts()
          .then((value) => emit(HomePageLoaded(postList, categoriesList)));
    });
  }

  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;
  Future<List<PostModel>> fetchPosts() {
    return commonRepository.fetchPosts().then(
          (value) => _postList = value,
        );
  }

  List<CategoryModel> _categoriesList = [];
  List<CategoryModel> get categoriesList => _categoriesList;
  Future<List<CategoryModel>> fetchCategories() {
    return commonRepository
        .fetchCategories()
        .then((value) => _categoriesList = value);
  }
}
