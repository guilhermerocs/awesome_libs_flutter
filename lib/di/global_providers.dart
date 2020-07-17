import 'package:awesome_libs_flutter/data/repository/user_repository.dart';
import 'package:awesome_libs_flutter/data/source/local/user_local.dart';
import 'package:awesome_libs_flutter/data/source/network/api_service.dart';
import 'package:awesome_libs_flutter/data/source/remote/user_remote.dart';
import 'package:awesome_libs_flutter/domain/usecase/login_usecase.dart';
import 'package:awesome_libs_flutter/ui/viewmodel/login_viewModel.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Remote Services
  serviceLocator.registerLazySingleton<ApiService>(
      () => ApiService.create(ApiClient().chopperClient));

  //Repositories
  serviceLocator.registerLazySingleton<UserRepository>(() => new UserRepository(
      userLocal: serviceLocator<UserLocal>(),
      userRemote: serviceLocator<UserRemote>()));

  serviceLocator.registerLazySingleton<UserRemote>(
      () => new UserRemote(apiService: serviceLocator<ApiService>()));

  serviceLocator.registerLazySingleton<UserLocal>(() => new UserLocal());

  //ViewModels
  serviceLocator
      .registerLazySingleton<LoginViewModel>(() => new LoginViewModel());

  //UseCases
  serviceLocator.registerLazySingleton<LoginUseCase>(
      () => new LoginUseCase(userRepository: serviceLocator<UserRepository>()));
}
