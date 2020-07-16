import 'package:awsome_libs_flutter/di/global_providers.dart';
import 'package:awsome_libs_flutter/routes.dart';
import 'package:awsome_libs_flutter/ui/viewmodel/login_viewModel.dart';
import 'package:awsome_libs_flutter/utils/constants.dart';
import 'package:awsome_libs_flutter/widgets/custom-button.dart';
import 'package:awsome_libs_flutter/widgets/custom-text-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobx/mobx.dart';



class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = serviceLocator<LoginViewModel>();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => viewModel.currentUser, (currentUser) {
      if (currentUser != null) {
        navigate(Routes.home, false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Constants.textWhiteColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Hero(
                  tag: "email_card",
                  child: CustomCardTextField(
                    labelText: "Email",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    value: viewModel.login,
                    onChange: (value) => viewModel.setLogin(value),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0, bottom: 22.0),
                  child: CustomCardTextField(
                    labelText: "Password",
                    obscureText: true,
                    value: viewModel.password,
                    onChange: (value) => viewModel.setPassword(value),
                  ),
                ),

                Observer(
                  builder: (_) {
                    return new CustomButton(
                        labelText: "LOGIN",
                        color: Constants.buttonGreenColor,
                        isLoading: viewModel.isLoading,
                        onClick: viewModel.loginPressed);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  navigate(page, clearStack) async {
    if (!clearStack) {
      await Navigator.pushNamed(
        context,
        page,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(context, page, (r) => false);
    }
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
