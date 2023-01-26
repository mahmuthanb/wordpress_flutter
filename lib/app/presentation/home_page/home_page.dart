import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_map/route_map.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/category/category.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/view/home_page_new_view.dart';
import 'package:wordpress_flutter/app/presentation/settings/settings.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/styles.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';
import 'package:wordpress_flutter/core/widget/post_card.dart';
import 'package:wordpress_flutter/app/router.routes.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Builder(
      builder: ((context) {
        if (state is HomePageInitial) {
          return const LoadingScreen();
        } else if (state is HomePageLoaded) {
          return HomePageNewView(
            viewModel.postList,
            viewModel.categoriesList,
            viewModel.headerText,
          );
        } else {
          return const LoadingScreen(title: "Error");
        }
      }),
    );
  }
}
