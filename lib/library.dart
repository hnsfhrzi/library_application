import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class libraryPage extends StatefulWidget {
  const libraryPage({Key? key}) : super(key: key);

  @override
  _libraryPageState createState() => _libraryPageState();
}

class _libraryPageState extends State<libraryPage> {
  int c = "A".codeUnitAt(0);
  int end = "Z".codeUnitAt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDEDB8),
        elevation: 0,
        centerTitle: true,
        title: Text(
          //Nama Page
          'Library',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        //Background
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Mainmenu.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //ShortCutLibrary
                    children: [
                      for (var i = c; i <= end; i++)
                        listShortCut(alpha: String.fromCharCode(i))
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Column(
                  //Kumpulan Kotak Hijau
                  children: [
                    for (var i = c; i <= end; i++)
                      greenBoxCont(alpha: String.fromCharCode(i))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Thumbnail Cerita Anak
class listLibrary extends StatelessWidget {
  const listLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

//shortcut library alphabet
class listShortCut extends StatelessWidget {
  final String alpha;

  const listShortCut({Key? key, required this.alpha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*Scrollable.ensureVisible(alpha.currentcont);*/
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Text(
          alpha,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

//GreenContainer
class greenBoxCont extends StatelessWidget {
  const greenBoxCont({Key? key, required this.alpha}) : super(key: key);
  final String alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      constraints: new BoxConstraints(
        minHeight: 50,
        minWidth: double.infinity,
        maxHeight: 590,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Color(0xFFD3E49C),
          width: 3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: Text(
              alpha,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: EdgeInsets.all(20),
                childAspectRatio: 5 / 8,
                children: [
                  listLibrary(),
                  listLibrary(),
                  listLibrary(),
                  listLibrary(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
