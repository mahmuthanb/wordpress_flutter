import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/app/cubit/test_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';

class TestCounter extends BaseWidget<TestCubit, TestState> {
  const TestCounter({super.key});

  @override
  Widget build(BuildContext context, TestCubit viewModel, TestState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("deneme"),
      ),
      body: Container(
        child: (state is TestInitial)
            ? Center(child: Text(viewModel.count.toString()))
            : Container(
                width: 1000,
                height: 1000,
                color: Colors.red,
              ),
      ),
      floatingActionButton: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            viewModel.incCount();
          }),
    );
  }
}
