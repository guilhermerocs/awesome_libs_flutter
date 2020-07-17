import 'package:awesome_libs_flutter/data/repository/user_repository.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';

class LoginUseCase {
  UserRepository userRepository;

  LoginUseCase({this.userRepository});

  Future<UserModel> execute(String login, String password) async {
    UserModel userModel = await userRepository.login(login, password);

    if (userModel != null) await userRepository.saveCurrentUser(userModel);
    return userModel;
  }
}
