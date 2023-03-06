import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String? _email;
  String? _password;

  String? get email => _email;
  String? get password => _password;

  void setEmail(String? newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String? newPassword) {
    _password = newPassword;
    notifyListeners();
  }
}
