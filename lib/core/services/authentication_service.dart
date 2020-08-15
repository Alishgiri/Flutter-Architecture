import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/core/services/api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    final fetchedUser = await _api.getUserProfile(userId);
    return fetchedUser != null;
  }
}
