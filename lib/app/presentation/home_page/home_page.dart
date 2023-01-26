import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_map/route_map.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/category/category.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
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
          // return HomePageNewView(
          //   state.postList,
          //   state.categoriesList,
          //   viewModel.headerText,
          // );
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  viewModel.headerText,
                  style: AppTextStyle.headerTextStyle,
                ),
                leading: IconButton(
                  onPressed: () => const SettingsPage().push(context),
                  icon: const Icon(Icons.menu),
                  color: AppColors.darkerThenGrey,
                ),
                // elevation: 0,
                centerTitle: true,
              ),
              backgroundColor: AppColors.primarySwatch,
              body: Builder(
                builder: (context) {
                  if (viewModel.postList.isEmpty) {
                    return Shimmer.fromColors(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) => Card(
                            child: Container(
                              height: size.height * .15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        baseColor: AppColors.shimmerBase,
                        highlightColor: AppColors.shimmerHighlighted);
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: AppColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: ListView.separated(
                              itemCount: viewModel.categoriesList.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: AppDimens.xxs),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => CategoryPage(
                                          cat: viewModel.categoriesList[index])
                                      .push(context),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: AppDimens.xs,
                                      horizontal: AppDimens.m,
                                    ),
                                    child: Text(
                                      viewModel.categoriesList[index].name!
                                          .toUpperCase(),
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.darkerThenGrey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: ListView.separated(
                            itemCount: viewModel.postList.length,
                            separatorBuilder: (context, index) => const Divider(
                              height: AppDimens.xxs,
                              color: AppColors.darkGrey,
                              thickness: .5,
                            ),
                            itemBuilder: (context, index) {
                              PostModel data = viewModel.postList[index];
                              return PostCard(data);
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ));
        } else {
          return const LoadingScreen(title: "Error");
        }
      }),
    );
  }
}
