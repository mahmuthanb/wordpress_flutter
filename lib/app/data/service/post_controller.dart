import 'package:get/get.dart';
import 'package:wordpress_flutter/app/data/model/post_model.dart';
import 'package:wordpress_flutter/app/data/repository/post_provider.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await PostProvider.fetchPost();
      if (posts != null) {
        postList.value = posts;
      }
    } finally {
      isLoading(false);
    }
  }
}
