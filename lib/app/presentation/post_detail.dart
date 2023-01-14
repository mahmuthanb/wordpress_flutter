import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:get/get.dart';
import 'package:wordpress_flutter/app/data/model/post_model.dart';
import 'package:wordpress_flutter/core/widget/image_view.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    Key? key,
    required this.postData,
  }) : super(key: key);
  final PostModel postData;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    String title =
        HtmlUnescape().convert(widget.postData.title!.rendered.toString());
    final AppBar appBar = AppBar();
    final Size size = MediaQuery.of(context).size;
    final double realHeight = size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: size.width * .075,
        title: SizedBox(
          width: size.width * .85,
          height: AppBar().preferredSize.height,
          child: Center(
            child: Marquee(
              text: title,
              key: Key("_${widget.postData}.title!.rendered.toString()"),
              style: GoogleFonts.ubuntuMono(
                fontWeight: FontWeight.bold,
              ),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            width: size.width,
            height: realHeight,
            child: SingleChildScrollView(
              child: Html(
                onLinkTap: (String? url, RenderContext ctx,
                    Map<String, String> attributes, dom.Element? element) {
                  var pageLoading = true.obs;
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
                                pageLoading(true);
                                printInfo(info: "Page load started");
                              },
                              onWebViewCreated: (controller) {
                                this.controller = controller;
                              },
                              onPageFinished: (finish) {
                                printError(info: "Page load finished");
                              },
                            ),
                          ),
                        );
                      });
                },
                onImageTap: (url, context, attributes, element) {
                  printInfo(info: "Resim tıklandı");
                  Get.to(() => ImageView(url: url!));
                },
                onImageError: (exception, stackTrace) {
                  exception.printInfo();
                  const snackBar = SnackBar(
                    content: Text('Error while loading an image!'),
                    duration: Duration(
                      seconds: 1,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                data: widget.postData.content!.rendered,
                style: {
                  "p": Style(
                    padding: const EdgeInsets.only(left: 10),
                    fontWeight: FontWeight.bold,
                  ),
                  "ol": Style(
                    border: Border.all(
                      color: Colors.cyanAccent,
                      width: 2,
                    ),
                  ),
                  "ul": Style(
                    fontWeight: FontWeight.bold,
                  ),
                  "li": Style(
                    listStyleType: ListStyleType.LOWER_ALPHA,
                  ),
                  "pre,code": Style(
                    whiteSpace: WhiteSpace.NORMAL,
                    padding: const EdgeInsets.all(5),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  "figure,img": Style(
                    backgroundColor: Colors.amberAccent,
                  )
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
