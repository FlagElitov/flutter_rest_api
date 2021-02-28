import 'package:flutter_rest_api/models/models.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Post> fetchPost(id) async {
  final response = await http.get(
      'https://jsonplaceholder.typicode.com/posts/${id != null ? id : ''}');

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
