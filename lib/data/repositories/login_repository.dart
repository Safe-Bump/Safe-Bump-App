import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  Future<UserCredential?> login(String? email, String? password);
  Future<UserCredential?> googleLogin();
  Future<UserCredential?> signUp(String email, String password);
}