import 'package:flutter/material.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';

class AppDecorations {
  static BoxDecoration roundedCorners =
      BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.m));

  static InputDecoration domainInputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    labelText: "Domain",
    hintText: 'http:// or https://',
    labelStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  static InputDecoration languageSelectorInputDecoration =
      const InputDecoration(
    border: OutlineInputBorder(),
    labelText: "Select your preferred language",
    labelStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
