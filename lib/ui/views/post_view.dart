import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture/core/models/post.dart';
import 'package:flutter_architecture/core/models/user.dart';
import 'package:flutter_architecture/ui/widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Text(post.title, style: tt.headline5),
            Text('by ${user.username}', style: tt.caption),
            const SizedBox(height: 10),
            Text(post.body),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
