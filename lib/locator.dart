import 'package:get_it/get_it.dart';

import 'package:flutter_architecture/core/services/api.dart';
import 'package:flutter_architecture/core/view_models/login_model.dart';
import 'package:flutter_architecture/core/services/authentication_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AuthenticationService());
}
