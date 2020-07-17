import 'package:awesome_libs_flutter/ui/view/home_page.dart';
import 'package:awesome_libs_flutter/ui/view/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginPage(),
    home: (BuildContext context) => HomePage(),
  };
}
