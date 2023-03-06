import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_use_case.dart';

@injectable
class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  UserModel? _user;

  UserModel? get user => _user;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<UserCredential?> login() async {
    setLoading(true);

    final result = await _loginUseCase.login(user);

    setLoading(false);

    return result;
  }

  Future<UserCredential?> googleLogin() async {
    setLoading(true);

    final result = await _loginUseCase.googleLogin();

    setLoading(false);

    return result;
  }
}
