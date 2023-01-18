import 'package:flutter/material.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.l, vertical: AppDimens.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Latest article with ',
                  style:
                      DefaultTextStyle.of(context).style.copyWith(fontSize: 44),
                  children: [
                    TextSpan(
                      text: 'better',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.yellow.shade200,
                        decorationStyle: TextDecorationStyle.solid,
                        letterSpacing: 1,
                      ),
                    ),
                    const TextSpan(text: ' news!'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.m,
                ),
                child: const Text(
                    "Browse the best news on latest strategies, trends various tools and news in the world"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade200,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: .2,
                      offset: Offset(3, 3), // Shadow position
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.m,
                      ),
                      child: const Center(
                        child: Text("Get started"),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                    ),
                    // Container(
                    //   color: Colors.black,
                    //   width: 15,
                    // ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.xs,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.5),
                          top: BorderSide(color: Colors.black, width: 1.5),
                          right: BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_right_alt,
                      ),
                    )
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child:
              //   style: ButtonStyle(
              //     backgroundColor:
              //         MaterialStateProperty.all(Colors.yellow.shade200),
              //     shadowColor: MaterialStateProperty.all(Colors.amber),

              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
