import 'package:flutter/material.dart';

import 'package:flutter_architecture/ui/views/base_view.dart';
import 'package:flutter_architecture/core/models/comment.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
import 'package:flutter_architecture/core/view_models/comments_model.dart';

class Comments extends StatelessWidget {
  final int postId;

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      initState: (model) => model.fetchComments(postId),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? CircularProgressIndicator()
          : Expanded(
              child: ListView(
                children: model.comments
                    .map((comment) => CommentItem(comment))
                    .toList(),
              ),
            ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(comment.body),
        ],
      ),
    );
  }
}
