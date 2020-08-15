import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/models/post.dart';
import 'package:flutter_architecture/core/services/api.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
import 'package:flutter_architecture/core/view_models/base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
