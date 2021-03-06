import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_application/library.dart';
import 'package:library_application/search.dart';
import 'package:library_application/setting.dart';

import 'favorite.dart';
import 'menu.dart';

class HomePg extends StatefulWidget {
  const HomePg({Key? key}) : super(key: key);

  @override
  _HomePgState createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {

  int currentTab = 0;
  final List<Widget> screen = [
    mainMenu(),
    libraryPage(),
    favoritePage(),
    settingsPg(),
    searchCerpen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = mainMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEDB8),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD3E49C),
        child: ImageIcon(
          NetworkImage("https://i.postimg.cc/q7h16vPh/Group-1.png"),
          color: Color(0xFF4F4F4F),
        ),
        onPressed: () {
          setState(() {
            currentScreen = searchCerpen();
            currentTab = 4;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width)/5,
                    onPressed: () {
                      setState(() {
                        currentScreen = mainMenu();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Main Menu',
                          style: TextStyle(fontSize: (MediaQuery.of(context).size.width)/38,color:  currentTab == 0 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width)/5,
                    onPressed: () {
                      setState(() {
                        currentScreen = libraryPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.book_solid,
                          color: currentTab == 1 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'List Cerpen',
                          style: TextStyle(fontSize:(MediaQuery.of(context).size.width)/38, color:  currentTab == 1 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width)/5,
                    onPressed: () {
                      setState(() {
                        currentScreen = favoritePage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: currentTab == 2 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(fontSize: (MediaQuery.of(context).size.width)/38,color:  currentTab == 2 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: (MediaQuery.of(context).size.width)/5,
                    onPressed: () {
                      setState(() {
                        currentScreen = settingsPg();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F),
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(fontSize:(MediaQuery.of(context).size.width)/38, color:  currentTab == 3 ? Color(0xFFB7CF67) : Color(0xFF4F4F4F)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}