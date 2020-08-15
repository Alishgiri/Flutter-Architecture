import 'package:flutter/material.dart';

import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/services/authentication_service.dart';

enum ViewState { Idle, Busy }

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    final userId = int.tryParse(userIdText);
    final success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
