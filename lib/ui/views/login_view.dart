import 'package:flutter/material.dart';

import 'package:flutter_architecture/ui/views/base_view.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
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
    return BaseView<LoginModel>(
      initState: (model) {},
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              controller: _controller,
              validationMessage: model.errorMessage,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    child: Text('Login'),
                    onPressed: () async {
                      final loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
