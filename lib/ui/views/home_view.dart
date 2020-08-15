import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture/core/models/post.dart';
import 'package:flutter_architecture/core/models/user.dart';
import 'package:flutter_architecture/ui/views/base_view.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
import 'package:flutter_architecture/ui/widgets/post_list_item.dart';
import 'package:flutter_architecture/core/view_models/home_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final user = Provider.of<User>(context);
    return BaseView<HomeModel>(
      initState: (model) => model.getPosts(user.id),
      builder: (context, model, widget) => Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child:
                        Text('Welcome ${user.username}!', style: tt.headline5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Here are all your posts', style: tt.subtitle2),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: getPostUi(model.posts))
                ],
              ),
      ),
    );
  }

  Widget getPostUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostListItem(
            post: post,
            onTap: () => Navigator.pushNamed(context, '/post', arguments: post),
          );
        },
      );
}
