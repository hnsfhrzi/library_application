import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:library_application/cerpen/cerpens.dart';
import '../previewcerpen.dart';

class readingPage extends StatefulWidget {
  const readingPage({Key? key, required this.title, required this.urlimg, required this.fuller}) : super(key: key);
  final String title;
  final String urlimg;
  final String fuller;

  @override
  _readingPageState createState() => _readingPageState();
}

class _readingPageState extends State<readingPage> {
  ScrollController? sc;
  double? _vWidth;

  @override
  void initState() {
    sc = new ScrollController()
      ..addListener(() {
        if(!this.mounted) return;
        _vWidth = double.parse((sc!.offset/sc!.position.maxScrollExtent).abs().toStringAsFixed(2));
        this.setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    this.sc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDEDB8),
        centerTitle: true,
        title: Text(
          widget.title,
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
                MaterialPageRoute(builder: (context) => PreviewCerpenPg(title: widget.title, urlimg: widget.urlimg, fullcrpn: widget.fuller,)));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.workspaces_outlined, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: this.sc,
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                                image: NetworkImage(widget.urlimg),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: AutoSizeText(
                        widget.fuller,
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
                    SizedBox(height: 30,),
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
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              height: 10,
              child: Container(
                width: (_vWidth ?? 0)*MediaQuery.of(context).size.width,
                color: Color(0xFFB7CF67),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
