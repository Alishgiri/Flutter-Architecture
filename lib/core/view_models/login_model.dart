import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/enum/view_state.dart';
import 'package:flutter_architecture/core/view_models/base_model.dart';
import 'package:flutter_architecture/core/services/authentication_service.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    final userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = "Value entered is not a number";
      setState(ViewState.Idle);
      return false;
    }
    final success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
