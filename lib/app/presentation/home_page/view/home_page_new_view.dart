import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/category/category_model.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/category/view/category_page.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/app/router.routes.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/text_style.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
              color: AppColors.darkerThenGrey,
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
                            onTap: () => CategoryPage(
                                    category: categoriesList[index].name!)
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
                        // height: AppDimens.xxs,
                        color: AppColors.darkGrey,
                        thickness: .5,
                      ),
                      itemBuilder: (context, index) {
                        PostModel data = postList[index];
                        return Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            // margin: const EdgeInsets.all(AppDimens.m),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppDimens.s),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * .90,
                                        child: Text(
                                          HtmlUnescape().convert(
                                              data.title!.rendered.toString()),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    (data.excerpt != null &&
                                            data.excerpt!.rendered != null)
                                        ? SizedBox(
                                            width: size.width * .9,
                                            height: size.height * .125,
                                            child: Center(
                                              child: Html(
                                                data: data.excerpt!.rendered,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                                Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppDimens.s),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.favorite_outline),
                                      const SizedBox(width: AppDimens.m),
                                      const Icon(Icons.volume_up),
                                      const Spacer(),
                                      const Icon(Icons.schedule),
                                      const SizedBox(width: AppDimens.xs),
                                      Text(timeago.format(data.date!)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
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
