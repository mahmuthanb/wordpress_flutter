import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/data/repository/common_repository.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final CommonRepository commonRepository;
  final LocalDataSource localDataSource;
  CategoryCubit(
    this.commonRepository,
    this.localDataSource,
  ) : super(CategoryInitial());

  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;
  void fetchPostsByCat(int catId) {
    commonRepository
        .fetchPostsByCategory([catId])
        .then((value) => _postList = value)
        .then((value) {
          if (_postList.isNotEmpty) {
            emit(CategoryPostLoaded(postList));
          }
        });
  }

  bool get isDark => localDataSource.darkTheme ?? false;
  set changeTheme(bool value) => localDataSource.setDarkTheme(value);
}
