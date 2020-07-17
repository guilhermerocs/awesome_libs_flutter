import 'dart:async';
import 'package:chopper/chopper.dart';
import 'error_handler.dart';

class MobileDataInterceptor implements RequestInterceptor, ResponseInterceptor {
  static const int SUCCESS_CODE = 200;

  @override
  FutureOr<Request> onRequest(Request request) async {
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    if (!response.isSuccessful) {
      ErrorHandler.handleResponseError(response.statusCode, response.error);
    }
    return response;
  }
}
