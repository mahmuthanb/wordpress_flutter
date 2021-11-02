import 'package:http/http.dart' as http;
import 'package:wordpress_flutter/const/connections.dart';
import 'package:wordpress_flutter/model/post_model.dart';

class PostProvider {
  static var client = http.Client();

  static Future<List<PostModel>?> fetchPost() async {
    var response = await client.get(Uri.parse('$restAPI/posts'));

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      return postFromJson(jsonResponse);
    } else {
      return null;
    }
  }

  // Get request
  // Future<Response> getAllPosts() => get('$restAPI/posts');
  // Post request
  // Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
  // // Post request with File

  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }

  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }
}
