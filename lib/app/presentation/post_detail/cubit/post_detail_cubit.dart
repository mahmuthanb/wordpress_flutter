import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(PostDetailInitial());
}
