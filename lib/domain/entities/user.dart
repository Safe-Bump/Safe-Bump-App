import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _name;

  String? get email => _email;

  String? get password => _password;

  String? get name => _name;

  void setEmail(String? newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String? newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void setName(String? newName) {
    _name=newName;
    notifyListeners();
  }
}
