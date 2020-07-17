import 'package:awesome_libs_flutter/data/repository/user_repository.dart';
import 'package:awesome_libs_flutter/di/global_providers.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';

class LoginUseCase {
  final _userRepository = serviceLocator<UserRepository>();

  Future<UserModel> execute(String login, String password) async {
    UserModel userModel = await _userRepository.login(login, password);

    if (userModel != null) await _userRepository.saveCurrentUser(userModel);
    return userModel;
  }
}
