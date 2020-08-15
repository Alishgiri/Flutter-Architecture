import 'package:flutter/material.dart';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      theme: ThemeData(),
      title: "Flutter Architecture",
    );
  }
}
