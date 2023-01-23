import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/category/view/category_page.dart';
import 'package:wordpress_flutter/app/presentation/settings/view/settings_view.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/app/router.routes.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/styles.dart';
import 'package:wordpress_flutter/core/widget/post_card.dart';

class HomePageNewView extends StatelessWidget {
  const HomePageNewView(
    this.postList,
    this.categoriesList,
    this.headerText, {
    super.key,
  });

  final List<PostModel> postList;
  final List<CategoryModel> categoriesList;
  final String headerText;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            headerText,
            style: AppTextStyle.headerTextStyle,
          ),
          leading: IconButton(
            onPressed: () => const SettingsPage().push(context),
            icon: const Icon(Icons.menu),
            color: AppColors.darkerThenGrey,
          ),
          elevation: 0,
          centerTitle: false,
          actions: [
            FlutterSwitch(
              width: 100.0,
              height: 45.0,
              padding: 0,
              toggleSize: 45.0,
              borderRadius: 30.0,
              value: true,
              activeToggleColor: const Color(0xFF6E40C9),
              inactiveToggleColor: const Color(0xFF2F363D),
              activeSwitchBorder: Border.all(
                color: const Color(0xFF3C1E70),
                width: 6.0,
              ),
              inactiveSwitchBorder: Border.all(
                color: const Color(0xFFD1D5DA),
                width: 6.0,
              ),
              activeColor: const Color(0xFF271052),
              inactiveColor: Colors.white,
              activeIcon: const Icon(
                Icons.nightlight_round,
                color: Color(0xFFF8E3A1),
              ),
              inactiveIcon: const Icon(
                Icons.wb_sunny,
                color: Color(0xFFFFDF5D),
              ),
              onToggle: (val) {
                // status7 = val;
                if (val) {
                  // dark theme enabled
                } else {
                  // light theme enabled
                }
              },
            )
          ],
        ),
        backgroundColor: AppColors.primarySwatch,
        body: Builder(
          builder: (context) {
            if (postList.isEmpty) {
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
                        itemCount: categoriesList.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: AppDimens.xxs),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                CategoryPage(cat: categoriesList[index])
                                    .push(context),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: AppDimens.xs,
                                horizontal: AppDimens.m,
                              ),
                              child: Text(
                                categoriesList[index].name!.toUpperCase(),
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
                      itemCount: postList.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: AppDimens.xxs,
                        color: AppColors.darkGrey,
                        thickness: .5,
                      ),
                      itemBuilder: (context, index) {
                        PostModel data = postList[index];
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
