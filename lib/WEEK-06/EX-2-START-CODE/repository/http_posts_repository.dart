import 'dart:convert';
import 'package:bla_bla_project/WEEK-06/EX-2-START-CODE/model/post.dart';
import 'package:bla_bla_project/WEEK-06/EX-2-START-CODE/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class PostHttpRepository extends PostRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Post fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    assert(json['title'] is String);
    assert(json['body'] is String);

    return Post(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }
}
