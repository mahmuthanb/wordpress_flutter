import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';

part 'wellcome_state.dart';

@injectable
class WellcomeCubit extends Cubit<WellcomeState> {
  WellcomeCubit() : super(WellcomeInitial());
  final LocalDataSourceImpl _dataSource =
      LocalDataSourceImpl(getIt<GetStorage>());

  bool? _isValid;
  bool? get isValid => _isValid;
  set setValid(bool? value) {
    _isValid = value;
  }

  Future onSave(String? value) => _dataSource.setDomain(value);
}
