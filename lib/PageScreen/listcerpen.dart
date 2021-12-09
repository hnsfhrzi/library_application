import 'package:flutter/material.dart';

class ListCerpenPg extends StatefulWidget {
  const ListCerpenPg({Key? key}) : super(key: key);

  @override
  _ListCerpenPgState createState() => _ListCerpenPgState();
}

class _ListCerpenPgState extends State<ListCerpenPg> {
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
