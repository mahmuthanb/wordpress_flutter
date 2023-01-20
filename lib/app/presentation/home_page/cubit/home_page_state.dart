part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState extends BaseCubitState {}

class HomePageInitial extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<PostModel> postList;
  final List<CategoryModel> categoriesList;
  HomePageLoaded(
    this.postList,
    this.categoriesList,
  );
}

class HomePageFail extends HomePageState {
  final String? message;
  HomePageFail({this.message});
}
