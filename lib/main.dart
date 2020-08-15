import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/ui/router.dart';
import 'package:flutter_architecture/core/models/user.dart';
import 'package:flutter_architecture/core/services/authentication_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: '/login',
        title: "Flutter Architecture",
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
