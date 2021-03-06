import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wordpress_flutter/const/colors.dart';
import 'package:wordpress_flutter/const/connections.dart';
import 'package:wordpress_flutter/controller/post_controller.dart';
import 'package:wordpress_flutter/model/post_model.dart';
import 'package:wordpress_flutter/view/post_detail.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar();
    final Size size = MediaQuery.of(context).size;
    final double realHeight = size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text(url.substring(8)),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                // exit(0);
              },
              icon: const Icon(
                Icons.exit_to_app,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Obx(() {
                if (postController.isLoading.value) {
                  return Shimmer.fromColors(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) => Card(
                          child: Container(
                            height: realHeight * .15,
                            width: size.width,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      baseColor: shimmerBase,
                      highlightColor: shimmerHighlighted);
                } else {
                  return ListView.builder(
                    itemCount: postController.postList.length,
                    itemBuilder: (context, index) {
                      PostModel data = postController.postList[index];
                      return Card(
                          elevation: 1,
                          child: GestureDetector(
                            onTap: () => Get.to(() => PostDetailPage(postData: postController.postList[index])),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              width: size.width,
                              height: realHeight * .15,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: size.width * .97 - 20,
                                        height: realHeight * .025,
                                        child: Text(
                                          HtmlUnescape().convert(data.title!.rendered.toString()),
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
                                      (data.excerpt != null && data.excerpt!.rendered != null)
                                          ? SizedBox(
                                              width: size.width * .9,
                                              height: realHeight * .125,
                                              child: Center(
                                                child: Html(
                                                  data: data.excerpt!.rendered,
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
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
