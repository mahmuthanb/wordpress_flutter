part of 'category_cubit.dart';

@immutable
abstract class CategoryState extends BaseCubitState {}

class CategoryInitial extends CategoryState {}

class CategoryPostLoaded extends CategoryState {
  final List<PostModel> postList;
  CategoryPostLoaded(this.postList);
}
