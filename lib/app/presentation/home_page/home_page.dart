import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:wordpress_flutter/app/presentation/home_page/view/home_page_new_view.dart';
import 'package:wordpress_flutter/core/widget/loading_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<PostModel> postList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            return const LoadingScreen();
          } else if (state is HomePageLoaded) {
            return HomePageNewView(state.postList);
          } else {
            return const LoadingScreen(title: "Error");
          }
        },
      ),
    );
  }
}
