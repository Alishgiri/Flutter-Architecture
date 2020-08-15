import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_architecture/core/models/post.dart';
import 'package:flutter_architecture/core/models/user.dart';
import 'package:flutter_architecture/core/models/comment.dart';

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    final res = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(res.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    final res = await client.get('$endpoint/posts?userId=$userId');
    final parsed = json.decode(res.body) as List<dynamic>;
    final posts = [for (var post in parsed) Post.fromJson(post)];
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    final res = await client.get('$endpoint/comments?postId=$postId');
    var parsed = json.decode(res.body) as List<dynamic>;
    final comments = [for (var comment in parsed) Comment.fromJson(comment)];
    return comments;
  }
}
