import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:library_application/cerpen/cerpens.dart';
import '../previewcerpen.dart';

class readingPage extends StatefulWidget {
  const readingPage({Key? key}) : super(key: key);

  @override
  _readingPageState createState() => _readingPageState();
}

class _readingPageState extends State<readingPage> {
  final allcerpens = cerpens.map((cerpens) {
    final title = cerpens.title.toString();
    final url = cerpens.urlimg.toString();
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDEDB8),
        centerTitle: true,
        title: Text(
          cerpens[0].title.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => PreviewCerpenPg()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.workspaces_outlined, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 160,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(cerpens[0].urlimg.toString()),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: AutoSizeText(
                cerpens[0].fullcerpen.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 200,
                overflow: TextOverflow.fade,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'END',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  '@InsCera 2021',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
