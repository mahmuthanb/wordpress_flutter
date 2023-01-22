import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordpress_flutter/core/res/colors.dart';

class AppTextStyle {
  static TextStyle headerTextStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, color: AppColors.darkerThenGrey);
}

class AppWebviewStyle {
  static Map<String, Style> htmlStyle = {
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
      listStyleType: ListStyleType.lowerAlpha,
    ),
    "pre,code": Style(
      whiteSpace: WhiteSpace.normal,
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
  };
}
