import 'package:awesome_libs_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final Color color;
  final Function onClick;
  bool isLoading = false;

  CustomButton({this.labelText, this.color, this.onClick, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: color,
        disabledColor: Constants.disabledButtonColor,
        onPressed: onClick,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: !isLoading
              ? Text(
                  labelText,
                  style: TextStyle(
                      color: Constants.textWhiteColor, fontSize: 18.0),
                )
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Constants.primaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}

