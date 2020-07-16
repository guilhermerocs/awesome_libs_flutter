import 'package:awsome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_result.g.dart';

@JsonSerializable(nullable: false)
class LoginResult {
  UserModel user;

  LoginResult({this.user});

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
