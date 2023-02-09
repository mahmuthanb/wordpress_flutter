import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';

@RouteMap()
class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    final PhotoViewController photoViewController = PhotoViewController();
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(url),
        actions: [
          IconButton(
            onPressed: () => photoViewController.setScaleInvisibly(1.5),
            icon: const Icon(Icons.zoom_in),
          ),
          IconButton(
            onPressed: () => photoViewController.setScaleInvisibly(1),
            icon: const Icon(Icons.zoom_out),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.m),
              child: PhotoView(
                backgroundDecoration: const BoxDecoration(
                  color: AppColors.white,
                  backgroundBlendMode: BlendMode.srcOver,
                ),
                controller: photoViewController,
                imageProvider: CachedNetworkImageProvider(url),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
