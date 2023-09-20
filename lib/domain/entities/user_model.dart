import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? email;
  final String? password;
  final String? name;
  final String? photoUrl;

  const UserModel(
    this.name, 
    this.email, 
    this.password, 
    this.photoUrl
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [name, email, password];
}
