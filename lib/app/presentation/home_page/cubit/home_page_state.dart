part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<PostModel> postList;
  HomePageLoaded({required this.postList});
}

class HomePageFail extends HomePageState {
  final String? message;
  HomePageFail({this.message});
}
