import 'package:awesome_libs_flutter/data/source/local/user_local.dart';
import 'package:awesome_libs_flutter/data/source/remote/user_remote.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:awesome_libs_flutter/domain/repository/user_repository.dart';

class UserRepository implements IAUserRepository {
  final UserRemote userRemote;
  final UserLocal userLocal;

  UserRepository({this.userRemote, this.userLocal});

  @override
  Future<UserModel> login(String login, String password) async {
    return await userRemote.login(login, password);
  }

  @override
  Future<void> saveCurrentUser(UserModel userModel) async {
    userLocal.saveCurrentUser(userModel);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return await userLocal.getCurrentUser();
  }
}
