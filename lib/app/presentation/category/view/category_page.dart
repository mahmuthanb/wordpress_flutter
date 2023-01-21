import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/category/cubit/category_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';

@RouteMap(name: 'category')
class CategoryPage extends BaseWidget<CategoryCubit, CategoryState> {
  const CategoryPage({required this.category, super.key});

  final String category;
  @override
  Widget build(
      BuildContext context, CategoryCubit viewModel, CategoryState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Column(
        children: [
          Text(category),
        ],
      ),
    );
  }
}
