
import 'dart:io';

import 'package:awesome_libs_flutter/routes.dart';
import 'package:awesome_libs_flutter/ui/view/login_page.dart';
import 'package:awesome_libs_flutter/utils/constants.dart';
import 'package:awesome_libs_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

import 'di/global_providers.dart';

void main() async {
  Utils.setupLogging();
  HttpOverrides.global = new MyHttpOverrides();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Constants.primaryColor),
      home: LoginPage(),
      routes: Routes.routes,
    );
  }
}
