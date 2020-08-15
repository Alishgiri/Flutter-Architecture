import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/services/api.dart';
import 'package:flutter_architecture/core/models/comment.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
import 'package:flutter_architecture/core/view_models/base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
