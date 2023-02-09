import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/view/home_page_new_view.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

@RouteMap(name: "home")
class HomePage extends BaseWidget<HomePageCubit, HomePageState> {
  const HomePage({Key? key}) : super(key: key);
  @override
  onModelReady(BuildContext context, HomePageCubit viewModel) {
    viewModel.getAll();
    return super.onModelReady(context, viewModel);
  }

  @override
  Widget build(
      BuildContext context, HomePageCubit viewModel, HomePageState state) {
    return Builder(
      builder: ((context) {
        if (state is HomePageInitial) {
          return const LoadingScreen();
        } else if (state is HomePageLoaded) {
          return HomePageNewView(viewModel);
        } else {
          return const LoadingScreen(title: "Error");
        }
      }),
    );
  }
}
