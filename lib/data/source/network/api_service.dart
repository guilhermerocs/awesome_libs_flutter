import 'dart:convert';
import 'dart:io';


import 'package:awesome_libs_flutter/domain/models/result/login_result.dart';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:chopper/chopper.dart';

import 'mobile_data_interceptor.dart';

import 'package:http/io_client.dart' as http;
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class ApiService extends ChopperService {
  @Post(path: 'auth/login')
  Future<Response<LoginResult>> loginUser(@Body() Map<String, dynamic> body);

  static ApiService create([ChopperClient client]) =>
      _$ApiService(client);
}

class ApiClient {
  final ChopperClient chopperClient;

  ApiClient()
      : chopperClient = ChopperClient(
      baseUrl: 'REPLACE_WITH_YOUR_API_URL',
      client: http.IOClient(
          HttpClient()
            ..connectionTimeout = const Duration(seconds: 10)),
      services: [
        _$ApiService(),
      ],
      interceptors: [
        MobileDataInterceptor(),
        HttpLoggingInterceptor(),
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HeadersInterceptor({'Content-Type': 'application/json'})
      ],
      converter: JsonToTypeConverter({
        LoginResult: (jsonData) => LoginResult.fromJson(jsonData),
        UserModel: (jsonData) => UserModel.fromJson(jsonData),
      }));
}

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.replace(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }

    return jsonParser(jsonMap);
  }
}
