import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'wellcome_state.dart';

class WellcomeCubit extends Cubit<WellcomeState> {
  WellcomeCubit() : super(WellcomeInitial());
  final LocalDataSourceImpl _dataSource =
      LocalDataSourceImpl(getIt<GetStorage>());
  Future onSave(String? value) => _dataSource.setDomain(value);
}
