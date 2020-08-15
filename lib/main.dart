import 'package:flutter/material.dart';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: '/login',
      title: "Flutter Architecture",
      onGenerateRoute: Router.generateRoute,
    );
  }
}
