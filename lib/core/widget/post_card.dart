import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/post_detail/post_detail.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wordpress_flutter/core/widget/shimmer.dart';

class PostCard extends StatelessWidget {
  const PostCard(this.data, {super.key});
  final PostModel data;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => PostDetailPage(post: data).push(context),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(
          vertical: AppDimens.m,
          horizontal: AppDimens.m,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * .90,
                  child: Text(
                    HtmlUnescape().convert(data.title!.rendered.toString()),
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
            Row(
              children: [
                (data.excerpt != null && data.excerpt!.rendered != null)
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
              margin: const EdgeInsets.only(top: AppDimens.m),
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
  }
}

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      child: Container(
        margin: const EdgeInsets.all(AppDimens.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidgets.rectangleShimmer,
            const Padding(padding: EdgeInsets.only(top: AppDimens.m)),
            ShimmerWidgets.generator(
              height: size.height * .1,
              width: size.width,
            ),
            const Padding(padding: EdgeInsets.only(top: AppDimens.m)),
            Row(children: [
              ShimmerWidgets.squareShimmer,
              const Padding(padding: EdgeInsets.only(left: AppDimens.m)),
              ShimmerWidgets.squareShimmer,
              const Spacer(),
              ShimmerWidgets.squareShimmer,
              const Padding(padding: EdgeInsets.only(left: AppDimens.m)),
              ShimmerWidgets.rectangleShimmer,
            ])
          ],
        ),
      ),
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlighted,
    );
  }
}
