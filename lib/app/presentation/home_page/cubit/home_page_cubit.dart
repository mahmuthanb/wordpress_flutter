import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/repository/common_repository.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'home_page_state.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final CommonRepository commonRepository;
  final LocalDataSource localDataSource;
  HomePageCubit(this.commonRepository, this.localDataSource)
      : super(HomePageInitial()) {
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

  bool get isDark => localDataSource.darkTheme ?? false;
  set changeTheme(bool value) {
    localDataSource.setDarkTheme(value);
    emit(HomePageLoaded(postList, categoriesList));
  }

  List<String> get domain => localDataSource.domain!.split('.');
  // TODO You can change your app title from here
  String get headerText => (domain[1] + domain[2]).toUpperCase();
}
