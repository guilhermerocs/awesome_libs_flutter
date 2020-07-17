import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(nullable: false)
class UserModel {
  String id;

  String email;

  String name;

  String type;

  String cpf;

  String city;

  String state;

  String createdAt;

  String updatedAt;

  String authToken;

  UserModel(
      {this.id,
      this.email,
      this.name,
      this.type,
      this.cpf,
      this.city,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.authToken});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
