import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/presentation/category/cubit/category_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/widget/post_card.dart';

@RouteMap(name: 'category')
class CategoryPage extends BaseWidget<CategoryCubit, CategoryState> {
  const CategoryPage(this.cat, {super.key});

  @override
  onModelReady(BuildContext context, CategoryCubit viewModel) {
    viewModel.fetchPostsByCat(cat.id!);
    return super.onModelReady(context, viewModel);
  }

  final CategoryModel cat;
  @override
  Widget build(
      BuildContext context, CategoryCubit viewModel, CategoryState state) {
    return Scaffold(
      backgroundColor: AppColors.categoryBasedScaffoldColor,
      appBar: AppBar(
        title: Text(cat.name!),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.text_fields)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.volume_up)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
        backgroundColor: AppColors.categoryBasedScaffoldColor,
      ),
      body: Builder(
        builder: (context) {
          if (state is CategoryPostLoaded) {
            return ListView.separated(
              itemBuilder: ((context, index) =>
                  PostCard(state.postList[index])),
              itemCount: state.postList.length,
              separatorBuilder: (context, index) => const Divider(
                height: AppDimens.xxs,
                color: AppColors.darkGrey,
                thickness: .5,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const PostCardShimmer(),
            );
          }
        },
      ),
    );
  }
}
