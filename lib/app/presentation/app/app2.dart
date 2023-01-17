import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/app/test.dart';
import 'package:wordpress_flutter/app/presentation/connectivity/cubit/internet_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/colors.dart';

class Myapp extends BaseWidget<InternetCubit, InternetState> {
  const Myapp({super.key});

  @override
  Widget build(
      BuildContext context, InternetCubit viewModel, InternetState state) {
    return MaterialApp(
      title: 'WordPress in Flutter',
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      debugShowCheckedModeBanner: false,
      home: const TestCounter(),
    );
  }
}
