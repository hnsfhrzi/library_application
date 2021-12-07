import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:library_application/Favorite.dart';
import 'package:library_application/menu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      activeIconColor: Colors.white,
      circleColor: Color(0xFFB7CF67),
      inactiveIconColor: Color(0xFF4F4F4F),
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: CupertinoIcons.book_solid, title: "List Cerita"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: CupertinoIcons.bookmark_solid, title: "Bookmark"),
        //TabData(iconData: Icons.settings, title: "Setting")
      ],
      onTabChangedListener: (position) {
        setState(() {});
      },
    );
  }
}
