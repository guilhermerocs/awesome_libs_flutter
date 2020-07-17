import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';

abstract class IAUserRepository {
  Future<UserModel> login(String login, String password);

  Future<void> saveCurrentUser(UserModel userModel);

  Future<UserModel> getCurrentUser();
}
