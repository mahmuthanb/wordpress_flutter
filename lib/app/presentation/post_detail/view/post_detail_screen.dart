import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/data/model/post/post_model.dart';
import 'package:wordpress_flutter/app/presentation/post_detail/cubit/post_detail_cubit.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';

@RouteMap()
class PostDetailPage extends BaseWidget<PostDetailCubit, PostDetailState> {
  const PostDetailPage(
    this.post, {
    super.key,
  });
  final PostModel post;
  @override
  Widget build(
      BuildContext context, PostDetailCubit viewModel, PostDetailState state) {
    return Text(HtmlUnescape().convert(post.title!.rendered.toString()));
  }
}
