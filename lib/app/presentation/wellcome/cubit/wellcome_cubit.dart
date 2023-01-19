import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'wellcome_state.dart';

class WellcomeCubit extends Cubit<WellcomeState> {
  WellcomeCubit(this.getStorage) : super(WellcomeInitial());
  GetStorage getStorage;
  Future onSave(String? value) => getStorage.write("domain", value);
}
