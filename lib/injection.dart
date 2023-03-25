import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/domain/entities/User.dart';
import 'package:safe_bump/domain/entities/user.dart';
import 'package:safe_bump/domain/repositories/dashboard_repository_impl.dart';
import 'package:safe_bump/domain/usecases/dashboard_use_case.dart';
import 'package:safe_bump/domain/usecases/login_use_case.dart';
import 'package:safe_bump/injection.config.dart';
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/dashboard_viewmodel.dart';

import 'data/repositories/login_repository.dart';
import 'domain/repositories/firebase_auth_repository.dart';

final locator = GetIt.instance;

@module
void configureLoginModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final googleSignIn = locator<GoogleSignIn>();

  locator.registerLazySingleton<LoginRepository>(
      () => FirebaseAuthRepository(firebaseAuth, googleSignIn));
  if(!locator.isRegistered<LoginUseCase>())
  locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(locator<LoginRepository>()));
  if (!locator.isRegistered<AuthViewModel>()) {
    locator.registerFactory(() => AuthViewModel(locator<LoginUseCase>()));
  }
}

@module
void configureDashboardModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton(
      () => DashboardRepositoryImpl(firebaseAuth, firestore));
  locator.registerLazySingleton(
      () => DashboardUseCase(locator<DashboardRepositoryImpl>()));
  if (!locator.isRegistered<DashboardViewModel>()) {
    locator
        .registerFactory(() => DashboardViewModel(locator<DashboardUseCase>()));
  }
}

@module
void configureFirebaseModuleInjection() {
  locator.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
}

@injectableInit
void configureInjection(String environment) {
  locator.init(environment: environment);
  configureFirebaseModuleInjection();
  configureLoginModuleInjection();
  configureDashboardModuleInjection();
}
