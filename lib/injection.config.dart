// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:safe_bump/data/repositories/login_repository.dart' as _i7;
import 'package:safe_bump/domain/repositories/firebase_auth_repository.dart'
    as _i3;
import 'package:safe_bump/domain/usecases/login_use_case.dart' as _i6;
import 'package:safe_bump/presentation/viewmodel/auth_viewmodel.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
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
    gh.factory<_i3.FirebaseAuthRepository>(() => _i3.FirebaseAuthRepository(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.GoogleSignIn>(),
        ));
    gh.factory<_i6.LoginUseCase>(
        () => _i6.LoginUseCase(gh<_i7.LoginRepository>()));
    gh.factory<_i8.AuthViewModel>(
        () => _i8.AuthViewModel(gh<_i6.LoginUseCase>()));
    return this;
  }
}
