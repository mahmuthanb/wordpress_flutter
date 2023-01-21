import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';

part 'post_detail_state.dart';

@injectable
class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(PostDetailInitial());
}
