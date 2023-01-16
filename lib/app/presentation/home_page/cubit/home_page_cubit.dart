import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/repository/posts_repository.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final PostsRepository postsRepository;
  HomePageCubit({
    required this.postsRepository,
  }) : super(HomePageInitial()) {
    fetchPosts().then((value) => emit(HomePageLoaded(postList: postList)));
  }

  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;
  Future<List<PostModel>> fetchPosts() {
    return postsRepository.fetchPosts().then(
          (value) => _postList = value,
        );
  }
}
