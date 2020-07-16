



import 'package:awsome_libs_flutter/data/source/network/api_service.dart';
import 'package:awsome_libs_flutter/di/global_providers.dart';
import 'package:awsome_libs_flutter/domain/models/body/loginBody.dart';
import 'package:awsome_libs_flutter/domain/models/entity/user_model.dart';

class UserRemote {
  final _meuSpaApiService = serviceLocator<ApiService>();

  Future<UserModel> login(String login, String password) async {
    LoginBody loginBody = LoginBody(email: login, password: password);
    final response = await _meuSpaApiService.loginUser(loginBody.toJson());

    var loginResult = response.body;
    if (loginResult != null && loginResult.user != null) {
      return loginResult.user;
    } else
      return null;
  }
}
