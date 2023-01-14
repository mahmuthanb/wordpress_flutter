import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpress_flutter/app/presentation/home_page.dart';

void main() {
  runApp(const WordPressFlutter());
}

class WordPressFlutter extends StatelessWidget {
  const WordPressFlutter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
