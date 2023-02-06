import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:route_map/route_map.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/post_detail/cubit/post_detail_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/res/styles.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';
import 'package:wordpress_flutter/core/widget/image_view.dart';

@RouteMap()
class PostDetailPage extends BaseWidget<PostDetailCubit, PostDetailState> {
  const PostDetailPage({
    required this.post,
    super.key,
  });
  final PostModel post;
  @override
  Widget build(
      BuildContext context, PostDetailCubit viewModel, PostDetailState state) {
    String title = HtmlUnescape().convert(post.title!.rendered.toString());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: size.width * .075,

        backgroundColor: AppColors.categoryBasedScaffoldColorDark,
        title: SizedBox(
          width: size.width * .95,
          height: AppBar().preferredSize.height,
          child: Center(
            child: Marquee(
              text: title,
              key: Key("_${post.title!.rendered.toString()}"),
              style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 40.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 2),
              showFadingOnlyWhenScrolling: true,
              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,
              numberOfRounds: 13,
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 50),
              decelerationCurve: Curves.easeOut,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Html(
                onLinkTap: (String? url, RenderContext ctx,
                    Map<String, String> attributes, _) {
                  // var pageLoading = true.obs;
                  final urlWithoutWWW = url!.replaceAll(RegExp('www.'), '');
                  showMaterialModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder: (builder) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            height: size.height * .75,
                            width: size.width,
                            child: WebView(
                              key: Key(urlWithoutWWW),
                              initialUrl: urlWithoutWWW,
                              javascriptMode: JavascriptMode.unrestricted,
                              onPageStarted: (urlWithoutWWW) {
                                // pageLoading(true);
                                printInfo(info: "Page load started");
                              },
                              onWebViewCreated: (controller) {
                                // this.controller = controller;
                              },
                              onPageFinished: (finish) {
                                printError(info: "Page load finished");
                              },
                              onWebResourceError: (error) {
                                var snackBar = SnackBar(
                                  content: Text(error.description),
                                  duration: const Duration(
                                    seconds: 1,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ),
                        );
                      });
                },
                customRenders: {
                  networkSourceMatcher(): networkImageRender(
                    loadingWidget: () => Shimmer.fromColors(
                      child: const CircularProgressIndicator(),
                      baseColor: AppColors.shimmerBase,
                      highlightColor: AppColors.shimmerHighlighted,
                    ),
                    altWidget: (imageUrl) => Container(
                      decoration: const BoxDecoration(
                          color: AppColors.shimmerHighlighted,
                          borderRadius:
                              BorderRadius.all(Radius.circular(AppDimens.m))),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppDimens.m),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.broken_image,
                              color: AppColors.red,
                              size: size.width * .2,
                            ),
                            Text('Image can\'t be shown: \$$imageUrl  ')
                          ],
                        ),
                      ),
                    ),
                    height: size.width * .2,
                    width: size.width * .2,
                  )
                },
                tagsList: Html.tags..addAll(["img"]),
                onImageTap: (url, ctx, attributes, element) {
                  printInfo(info: "Resim tıklandı");
                  ImageView(url: url!).push(context);
                },
                onImageError: (exception, stackTrace) {
                  // exception.printInfo();
                  const snackBar = SnackBar(
                    content: Text('Error while loading an image!'),
                    duration: Duration(
                      seconds: 1,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                data: post.content!.rendered,
                style: AppWebviewStyle.htmlStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
