import 'package:flutter/material.dart';
import 'package:wordpress_flutter/core/res/decorations.dart';

class ShimmerWidgets {
  static Widget squareShimmer = Container(
    decoration: AppDecorations.roundedCorners.copyWith(
      color: Colors.white,
    ),
    height: 30,
    width: 30,
  );
  static Widget rectangleShimmer = Container(
    decoration: AppDecorations.roundedCorners.copyWith(
      color: Colors.white,
    ),
    height: 30,
    width: 80,
  );

  static Widget generator({double? width, double? height}) {
    return Container(
      decoration: AppDecorations.roundedCorners.copyWith(
        color: Colors.white,
      ),
      height: height ?? 30,
      width: width ?? 30,
    );
  }
}
