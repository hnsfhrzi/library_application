import 'package:flutter/material.dart';

class settingsPg extends StatefulWidget {
  const settingsPg({Key? key}) : super(key: key);

  @override
  _settingsPgState createState() => _settingsPgState();
}

class _settingsPgState extends State<settingsPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Background.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}