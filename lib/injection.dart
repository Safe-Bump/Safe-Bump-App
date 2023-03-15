import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/domain/entities/User.dart';
import 'package:safe_bump/domain/entities/user.dart';
import 'package:safe_bump/domain/usecases/login_use_case.dart';
import 'package:safe_bump/injection.config.dart';
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart';

import 'data/repositories/login_repository.dart';
import 'domain/repositories/firebase_auth_repository.dart';

final locator = GetIt.instance;

void configureLoginModuleInjection() {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  locator.registerLazySingleton(
      () => FirebaseAuthRepository(firebaseAuth, googleSignIn));
  locator.registerLazySingleton(
      () => LoginUseCase(locator<FirebaseAuthRepository>()));
  if (!locator.isRegistered<AuthViewModel>()) {
    locator.registerFactory(() => AuthViewModel(locator<LoginUseCase>()));
  }
}


@injectableInit
void configureInjection(String environment) {
  locator.init(environment: environment);
  configureLoginModuleInjection();
}
