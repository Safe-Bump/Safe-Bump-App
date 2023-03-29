// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:safe_bump/data/repositories/calendar_repository.dart' as _i4;
import 'package:safe_bump/data/repositories/dashboard_repository.dart' as _i6;
import 'package:safe_bump/data/repositories/login_repository.dart' as _i8;
import 'package:safe_bump/data/repositories/profile_repository.dart' as _i10;
import 'package:safe_bump/data/repositories/timeline_repository.dart' as _i12;
import 'package:safe_bump/domain/usecases/calendar_use_case.dart' as _i3;
import 'package:safe_bump/domain/usecases/dashboard_use_case.dart' as _i5;
import 'package:safe_bump/domain/usecases/login_use_case.dart' as _i7;
import 'package:safe_bump/domain/usecases/profile_use_case.dart' as _i9;
import 'package:safe_bump/domain/usecases/timeline_use_case.dart' as _i11;
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CalendarUseCase>(
        () => _i3.CalendarUseCase(gh<_i4.CalendarRepository>()));
    gh.factory<_i5.DashboardUseCase>(
        () => _i5.DashboardUseCase(gh<_i6.DashboardRepository>()));
    gh.factory<_i7.LoginUseCase>(
        () => _i7.LoginUseCase(gh<_i8.LoginRepository>()));
    gh.factory<_i9.ProfileUseCase>(
        () => _i9.ProfileUseCase(gh<_i10.ProfileRepository>()));
    gh.factory<_i11.TimelineUseCase>(
        () => _i11.TimelineUseCase(gh<_i12.TimelineRepository>()));
    gh.factory<_i13.AuthViewModel>(
        () => _i13.AuthViewModel(gh<_i7.LoginUseCase>()));
    return this;
  }
}
