import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/text_style.dart';

class HomePageNewView extends StatelessWidget {
  const HomePageNewView(this.postList, {super.key});

  final List<PostModel> postList;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double realHeight = size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MAHMUTHANCOM",
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
                        height: realHeight * .15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  baseColor: AppColors.shimmerBase,
                  highlightColor: AppColors.shimmerHighlighted);
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: size.height * .05,
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
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Text('CATEGORY $index');
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: AppDimens.xxs),
                          itemCount: 6),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        PostModel data = postList[index];
                        return Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('post-detail', arguments: data),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: AppDimens.s,
                                  horizontal: AppDimens.s,
                                ),
                                width: size.width,
                                height: realHeight * .15,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: size.width * .97 - 20,
                                          height: realHeight * .025,
                                          child: Text(
                                            HtmlUnescape().convert(data
                                                .title!.rendered
                                                .toString()),
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        (data.excerpt != null &&
                                                data.excerpt!.rendered != null)
                                            ? SizedBox(
                                                width: size.width * .9,
                                                height: realHeight * .125,
                                                child: Center(
                                                  child: Html(
                                                    data:
                                                        data.excerpt!.rendered,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
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
