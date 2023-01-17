import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  int count = 0;

  void incCount() {
    count++;
    print(count);
  }
}
