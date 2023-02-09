import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/category/view/category_page.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/settings/view/settings_view.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/wellcome.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/styles.dart';
import 'package:wordpress_flutter/core/widget/post_card.dart';

class HomePageNewView extends StatelessWidget {
  const HomePageNewView(
    this.viewModel, {
    super.key,
  });

  // final List<PostModel> postList;
  // final List<CategoryModel> categoriesList;
  // final String headerText;
  final HomePageCubit viewModel;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          actions: [
            IconButton(
              onPressed: () => viewModel.logout().then((value) =>
                  const WellcomePage()
                      .pushAndRemoveUntil(context, (p0) => false)),
              icon: const Icon(Icons.cancel),
              color: AppColors.darkerThenGrey,
            ),
          ],
          // elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Builder(
          builder: (context) {
            if (viewModel.postList.isEmpty) {
              return Shimmer.fromColors(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(AppDimens.s),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppDimens.s),
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
                            child: Center(
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
  }
}
