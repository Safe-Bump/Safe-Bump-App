import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_bump/domain/entities/user.dart';

import '../../data/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<UserCredential?> login(UserModel? user) async {
    final userCredential = await _loginRepository.login(user?.email,user?.password);
    return userCredential;
  }

  Future<UserCredential?> googleLogin() async {
    final userCredential = await _loginRepository.googleLogin();
    return userCredential;
  }
}