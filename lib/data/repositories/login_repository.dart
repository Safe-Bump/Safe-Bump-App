import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/domain/entities/user_model.dart';

abstract class LoginRepository {
  Future<UserCredential?> login(String? email, String? password, BuildContext context);
  Future<UserCredential?> googleLogin();
  Future<UserCredential?> signUp(UserModel? user, BuildContext context);
}