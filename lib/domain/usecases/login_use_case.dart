import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/domain/entities/user_model.dart';

import '../../data/repositories/login_repository.dart';

@injectable
class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<UserCredential?> login(String? email, String? password, BuildContext context) async {
    final userCredential = await _loginRepository.login(email, password, context);
    return userCredential;
  }

  Future<UserCredential?> googleLogin() async {
    final userCredential = await _loginRepository.googleLogin();
    return userCredential;
  }

  Future<UserCredential?> signUp(UserModel? user, BuildContext context) async {
    final userCredential = await _loginRepository.signUp(user, context);
    return userCredential;
  }
}