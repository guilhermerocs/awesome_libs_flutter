import 'package:awesome_libs_flutter/data/source/network/api_service.dart';
import 'package:awesome_libs_flutter/di/global_providers.dart';
import 'package:awesome_libs_flutter/domain/models/body/loginBody.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';

class UserRemote {
  final _apiService = serviceLocator<ApiService>();

  Future<UserModel> login(String login, String password) async {
    LoginBody loginBody = LoginBody(email: login, password: password);
    final response = await _apiService.loginUser(loginBody);

    var loginResult = response.body;
    if (loginResult != null && loginResult.user != null) {
      return loginResult.user;
    } else
      return null;
  }
}
