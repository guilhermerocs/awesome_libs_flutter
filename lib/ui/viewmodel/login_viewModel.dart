import 'package:awesome_libs_flutter/di/global_providers.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:awesome_libs_flutter/domain/usecase/login_usecase.dart';
import 'package:awesome_libs_flutter/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'login_viewModel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _loginUseCase = serviceLocator<LoginUseCase>();

  @observable
  bool isLoading = false;

  @observable
  String login = "";

  @observable
  String password = "";

  @observable
  UserModel currentUser;

  @action
  _setLoading(bool value) => isLoading = value;

  @action
  setLogin(String value) => login = value;

  @action
  setPassword(String value) => password = value;

  @action
  setCurrentUser(UserModel value) => currentUser = value;

  @computed
  bool get isEmailValid => Utils.validateEmail(login);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !isLoading) ? logInUser : null;

  successLogIn(UserModel userModel) {
    currentUser = userModel;
  }

  errorLogIn(String message) {
    print(message);
  }

  @action
  Future<void> logInUser() async {
    _setLoading(true);

    UserModel userModel = await _loginUseCase.execute(login, password);
    _setLoading(false);

    if (userModel != null) successLogIn(userModel);
  }

}