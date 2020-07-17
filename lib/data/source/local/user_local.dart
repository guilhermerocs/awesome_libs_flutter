import 'dart:convert';
import 'package:awesome_libs_flutter/domain/models/entity/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocal {
  static const String CURRENT_USER = "currentUser";

  Future<void> saveCurrentUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CURRENT_USER, json.encode(userModel.toJson()));
  }

  Future<UserModel> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userString = prefs.get(CURRENT_USER);
    if (userString != null) {
      var parsedUser = json.decode(userString);
      return UserModel.fromJson(parsedUser);
    } else
      return null;
  }
}
