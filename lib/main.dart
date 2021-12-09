import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:library_application/menu.dart';
=======
import 'package:library_application/home.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sen'),
      home: const HomePg(),
      title: 'Library apps',
    );
  }
}
