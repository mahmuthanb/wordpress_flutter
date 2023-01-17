import 'package:flutter/material.dart';
import 'package:wordpress_flutter/app/presentation/app/cubit/test_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';

class TestCounter extends BaseWidget<TestCubit, TestState> {
  const TestCounter({super.key});

  @override
  Widget build(BuildContext context, TestCubit cubit, TestState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("deneme"),
      ),
      body: Container(
        child: (state is TestInitial)
            ? Center(child: Text(cubit.count.toString() + "asdada"))
            : Container(
                width: 1000,
                height: 1000,
                color: Colors.red,
              ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.abc),
        onPressed: () => cubit.incCount(),
      ),
    );
  }
}
