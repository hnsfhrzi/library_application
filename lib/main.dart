import 'package:flutter/material.dart';
import 'package:library_application/bottomnavbar.dart';
import 'package:library_application/favorite.dart';
import 'package:library_application/library.dart';
import 'package:library_application/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sen'),
      home: const libraryPage(),
      title: 'Library apps',
    );
  }
}
