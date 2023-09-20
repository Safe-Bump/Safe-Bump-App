import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/data/repositories/calendar_repository.dart';
import 'package:safe_bump/data/repositories/dashboard_repository.dart';
import 'package:safe_bump/data/repositories/hospital_repository.dart';
import 'package:safe_bump/data/repositories/pregnancy_detail_repository.dart';
import 'package:safe_bump/data/repositories/profile_repository.dart';
import 'package:safe_bump/domain/repositories/calendar_repository_impl.dart';
import 'package:safe_bump/domain/repositories/dashboard_repository_impl.dart';
import 'package:safe_bump/domain/repositories/hospital_repository_impl.dart';
import 'package:safe_bump/domain/repositories/pregnancy_detail_repository_impl.dart';
import 'package:safe_bump/domain/repositories/profile_repository_impl.dart';
import 'package:safe_bump/domain/repositories/risk_detector_repository_impl.dart';
import 'package:safe_bump/domain/usecases/calendar_use_case.dart';
import 'package:safe_bump/domain/usecases/dashboard_use_case.dart';
import 'package:safe_bump/domain/usecases/hospital_use_case.dart';
import 'package:safe_bump/domain/usecases/login_use_case.dart';
import 'package:safe_bump/domain/usecases/pregnancy_detail_use_case.dart';
import 'package:safe_bump/domain/usecases/profile_use_case.dart';
import 'package:safe_bump/domain/usecases/risk_detector_use_case.dart';
import 'package:safe_bump/injection.config.dart';
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/calendar_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/dashboard_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/hospital_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/pregnancy_detail_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/profile_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/risk_detector_viewmodel.dart';
import 'package:safe_bump/presentation/viewmodel/timeline_viewmodel.dart';

import 'data/repositories/login_repository.dart';
import 'data/repositories/risk_detector_repository.dart';
import 'data/repositories/timeline_repository.dart';
import 'domain/repositories/firebase_auth_repository.dart';
import 'domain/repositories/timeline_repository_impl.dart';
import 'domain/usecases/timeline_use_case.dart';

final locator = GetIt.instance;

@module
void configureLoginModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final googleSignIn = locator<GoogleSignIn>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<LoginRepository>(
      () => FirebaseAuthRepository(firebaseAuth, googleSignIn, firestore));
  if (!locator.isRegistered<LoginUseCase>()) {
    locator.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(locator<LoginRepository>()));
  }
  if (!locator.isRegistered<AuthViewModel>()) {
    locator.registerFactory(() => AuthViewModel(locator<LoginUseCase>()));
  }
}

@module
void configureDashboardModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(firebaseAuth, firestore));
  if (!locator.isRegistered<DashboardUseCase>()) {
    locator.registerLazySingleton<DashboardUseCase>(
        () => DashboardUseCase(locator<DashboardRepository>()));
  }
  if (!locator.isRegistered<DashboardViewModel>()) {
    locator.registerFactory<DashboardViewModel>(
        () => DashboardViewModel(locator<DashboardUseCase>()));
  }
}

@module
void configureCalendarModuleInjection() {
  // ignore: unused_local_variable
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<CalendarRepository>(
      () => CalendarRepositoryImpl(firestore));

  if (!locator.isRegistered<CalendarUseCase>()) {
    locator.registerLazySingleton<CalendarUseCase>(
        () => CalendarUseCase(locator<CalendarRepository>()));
  }

  if (!locator.isRegistered<CalendarViewModel>()) {
    locator.registerFactory<CalendarViewModel>(
        () => CalendarViewModel(locator<CalendarUseCase>()));
  }
}

@module
void configurePregnancyDetailModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<PregnancyDetailRepository>(
      () => PregnancyDetailRepositoryImpl(firebaseAuth, firestore));

  if (!locator.isRegistered<PregnancyDetailUseCase>()) {
    locator.registerLazySingleton<PregnancyDetailUseCase>(
        () => PregnancyDetailUseCase(locator<PregnancyDetailRepository>()));
  }

  if (!locator.isRegistered<PregnancyDetailViewModel>()) {
    locator.registerFactory<PregnancyDetailViewModel>(
        () => PregnancyDetailViewModel(locator<PregnancyDetailUseCase>()));
  }
}

@module
void configureProfileModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(firestore, firebaseAuth));

  if (!locator.isRegistered<ProfileUseCase>()) {
    locator.registerLazySingleton<ProfileUseCase>(
        () => ProfileUseCase(locator<ProfileRepository>()));
  }

  if (!locator.isRegistered<ProfileViewModel>()) {
    locator.registerFactory<ProfileViewModel>(
        () => ProfileViewModel(locator<ProfileUseCase>()));
  }
}

@module
void configureTimelineModuleInjection() {
  final firebaseAuth = locator<FirebaseAuth>();
  final firestore = locator<FirebaseFirestore>();

  locator.registerLazySingleton<TimelineRepository>(
      () => TimelineRepositoryImpl(firestore, firebaseAuth));

  if (!locator.isRegistered<TimelineUseCase>()) {
    locator.registerLazySingleton<TimelineUseCase>(
        () => TimelineUseCase(locator<TimelineRepository>()));
  }

  if (!locator.isRegistered<TimelineViewModel>()) {
    locator.registerFactory<TimelineViewModel>(
        () => TimelineViewModel(locator<TimelineUseCase>()));
  }
}

@module
void configureHospitalModuleInjection() {
  final dio = locator<Dio>();
  locator.registerLazySingleton<HospitalRepository>(
      () => HospitalRepositoryImpl(dio));

  if (!locator.isRegistered<HospitalUseCase>()) {
    locator.registerLazySingleton<HospitalUseCase>(
        () => HospitalUseCase(locator<HospitalRepository>()));
  }

  if (!locator.isRegistered<HospitalViewModel>()) {
    locator.registerFactory<HospitalViewModel>(
        () => HospitalViewModel(locator<HospitalUseCase>()));
  }
}

@module
void configureRiskDetectorModuleInjection() {
  final dio = locator<Dio>();
  locator.registerLazySingleton<RiskDetectorRepository>(
      () => RiskDetectorRepositoryImpl(dio));

  if (!locator.isRegistered<RiskDetectorUseCase>()) {
    locator.registerLazySingleton<RiskDetectorUseCase>(
        () => RiskDetectorUseCase(locator<RiskDetectorRepository>()));
  }

  if (!locator.isRegistered<RiskDetectorViewModel>()) {
    locator.registerFactory<RiskDetectorViewModel>(
        () => RiskDetectorViewModel(locator<RiskDetectorUseCase>()));
  }
}

@module
void configureServicesModuleInjection() {
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
}

@InjectableInit()
void configureInjection(String environment) {
  locator.init(environment: environment);
  configureServicesModuleInjection();
  configureLoginModuleInjection();
  configureDashboardModuleInjection();
  configureProfileModuleInjection();
  configureTimelineModuleInjection();
  configureHospitalModuleInjection();
  configureRiskDetectorModuleInjection();
  configureCalendarModuleInjection();
  configurePregnancyDetailModuleInjection();
}
