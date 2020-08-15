import 'dart:async';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/models/user.dart';
import 'package:flutter_architecture/core/services/api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    final fetchedUser = await _api.getUserProfile(userId);
    final hasUser = fetchedUser != null;
    if (hasUser) userController.add(fetchedUser);
    return hasUser;
  }
}
