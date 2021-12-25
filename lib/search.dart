import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_application/cerpen/cerpens.dart';
import 'package:library_application/home.dart';

import 'library.dart';

class searchCerpen extends StatefulWidget {
  const searchCerpen({Key? key}) : super(key: key);

  @override
  _searchCerpenState createState() => _searchCerpenState();
}

class _searchCerpenState extends State<searchCerpen> {
  final searchcont = TextEditingController();
  List<Cerpen> titlesearch = [];
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEDB8),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
            icon: Icon(CupertinoIcons.back, size: 35, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePg()));
            }),
        title: TextField(
          onChanged: (value) {
            setState(() {
              titlesearch = cerpens.where((element) => element.title.contains(value.toLowerCase())).toList();
            });
          },
          controller: searchcont,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Search keyword..',
          ),
        ),
        backgroundColor: Colors.white60,
      ),
      body: searchcont.text.isNotEmpty&&titlesearch.isEmpty ?
      Center(child: Text('No Result Found'))
      : Container(
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            //physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: EdgeInsets.all(20),
            childAspectRatio: 5 / 8,
            children: searchcont.text.isNotEmpty ? cerpens.map((cerpen) => listLibrary(
                url: cerpen.urlimg,
                title: cerpen.title,
                fuller: cerpen.fullcerpen
            )).toList() : titlesearch.map((cerpen) => listLibrary(
                url: cerpen.urlimg, title: cerpen.title, fuller: cerpen.fullcerpen
            )).toList()
          ),
        ),
      );
  }
}

