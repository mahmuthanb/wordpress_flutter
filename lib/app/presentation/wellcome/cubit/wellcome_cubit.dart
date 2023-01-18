import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wellcome_state.dart';

class WellcomeCubit extends Cubit<WellcomeState> {
  WellcomeCubit() : super(WellcomeInitial());
}
