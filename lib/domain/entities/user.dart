import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class UserModel extends ChangeNotifier {
  String email;
  String password;
  String name;


  UserModel({required this.name, required this.email, required this.password});

}
