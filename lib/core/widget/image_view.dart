import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.back(),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.5),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          controller: PhotoViewController(),
          imageProvider: CachedNetworkImageProvider(url),
        ),
      ),
    );
  }
}
