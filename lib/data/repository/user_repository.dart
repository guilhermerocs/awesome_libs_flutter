import 'package:awesome_libs_flutter/data/source/local/user_local.dart';
import 'package:awesome_libs_flutter/data/source/remote/user_remote.dart';
import 'package:awesome_libs_flutter/di/global_providers.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:awesome_libs_flutter/domain/repository/user_repository.dart';

class UserRepository implements IAUserRepository {
  final _userRemote = serviceLocator<UserRemote>();
  final _userLocal = serviceLocator<UserLocal>();

  @override
  Future<UserModel> login(String login, String password) async {
    return await _userRemote.login(login, password);
  }

  @override
  Future<void> saveCurrentUser(UserModel userModel) async {
    _userLocal.saveCurrentUser(userModel);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return await _userLocal.getCurrentUser();
  }
}
