import 'package:awsome_libs_flutter/utils/utils.dart';

class ErrorHandler {
  static void handleResponseError(int code, String message) {
    switch (code) {
      case -1:
        Utils.showErrorToast(
            "Aconteceu um erro inesperado, tente novamente mais tarde!");
        break;
      default:
        Utils.showErrorToast(message);
    }
  }
}
