import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    String? title,
  })  : _title = title,
        super(key: key);

  final String? _title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.green.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(size.width * .05),
            height: size.width * .1,
            width: size.width * .1,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          DefaultTextStyle(
            style: GoogleFonts.titilliumWeb(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(_title ?? 'connection waiting'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
