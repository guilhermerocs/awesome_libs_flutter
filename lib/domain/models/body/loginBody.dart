import 'package:json_annotation/json_annotation.dart';

part 'loginBody.g.dart';

@JsonSerializable(nullable: false)
class LoginBody {
  String email;
  String password;

  LoginBody({this.email, this.password});

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
