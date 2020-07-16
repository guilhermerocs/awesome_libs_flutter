
import 'package:awsome_libs_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.disabledButtonColor,
      appBar: AppBar(
        title: Text("Logged"),
      ),
    );
  }
}