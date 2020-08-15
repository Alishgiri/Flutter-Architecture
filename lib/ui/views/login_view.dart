import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/ui/widgets/login_header.dart';
import 'package:flutter_architecture/core/view_models/login_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeader(controller: _controller),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      child: Text('Login'),
                      onPressed: () async {
                        final loginSuccess =
                            await model.login(_controller.text);
                        if (loginSuccess) {}
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
