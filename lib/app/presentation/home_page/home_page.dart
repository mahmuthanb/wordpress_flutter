import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/data/model/post_model.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/view/home_page_view.dart';
import 'package:wordpress_flutter/app/data/repository/connections.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<PostModel> postList = [];
  @override
  Widget build(BuildContext context) {
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
                onPressed: () => exit(0),
                icon: const Icon(
                  Icons.exit_to_app,
                ))
          ],
        ),
        body: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state is HomePageInitial) {
              return const LoadingScreen();
            } else if (state is HomePageLoaded) {
              return HomePageView(state.postList);
            } else {
              return const LoadingScreen(title: "Error");
            }
          },
        ));
  }
}
