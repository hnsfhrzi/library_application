import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_application/previewcerpen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cerpen/cerpens.dart';

class mainMenu extends StatelessWidget {
  const mainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDEDB8),
        elevation: 0,
        centerTitle: true,
        title: Text(
          //bagian nama aplikasi
          'InsCera',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: Container(
          //Bagian awal untuk masukin background
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Mainmenu.jpg"),
                fit: BoxFit.cover),
          ),
          //kode background sampai sini
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    //bagian menyambut pengguna
                    "Welcome 😀, let's read something!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  //isi berita atau info cerita paling baru
                  HotNewsSlider(),
                  //SizedBox(height: 20),
                  Container(
                    //tulisan genre
                    padding: EdgeInsets.only(left: 15),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Genre',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    //kumpulan genre
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ListGenre(url: 'https://i.postimg.cc/tTtXqcd2/Frame-4.png',),
                          ListGenre(url: 'https://i.postimg.cc/7L7kYR1j/Frame-5.png',),
                          ListGenre(url: 'https://i.postimg.cc/cHBGf8bm/Frame-6.png',),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    //tulisan Recently Read
                    padding: EdgeInsets.only(left: 15),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Recently Read',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    alignment: AlignmentDirectional.centerStart,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: cerpens.map((crpn) => ListRecent(
                            title: crpn.title,
                            url: crpn.urlimg,
                            fullcrpn: crpn.fullcerpen,
                        )).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//class untuk slider
class HotNewsSlider extends StatefulWidget {
  const HotNewsSlider({Key? key}) : super(key: key);

  @override
  _HotNewsSliderState createState() => _HotNewsSliderState();
}

class _HotNewsSliderState extends State<HotNewsSlider> {
  int activeIndex = 0;
  final HotUrl = [
    'https://i.postimg.cc/5yLQc2kx/Frame-1.png',
    'https://i.postimg.cc/3Jj0nWv1/Frame-2.png',
    'https://i.postimg.cc/HLnJY2Pv/Frame-3.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 160,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 20),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: HotUrl.length,
            itemBuilder: (context, index, realIndex) {
              final Hoturl = HotUrl[index];
              return buildImage(Hoturl, index);
            },
          ),
          const SizedBox(height: 20),
          buildIndicator(),
        ],
      ),
    );
  }

  //buat nampilin image dicarousel slider
  Widget buildImage(String hoturl, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        hoturl,
        fit: BoxFit.fill,
      ),
    );
  }

  //untuk nampilin indikatornya
  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: HotUrl.length,
      effect: ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Color(0xFFB7CF67),
        dotColor: Colors.black12,
      ),
    );
  }
}

//class list genre
class ListGenre extends StatelessWidget {
  const ListGenre({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Container(
          height: 75,
          width: 186,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

//class list recent
class ListRecent extends StatelessWidget {
  final String title;
  final String url;
  final String fullcrpn;

  const ListRecent({Key? key, required this.title, required this.url, required this.fullcrpn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        height: 160,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Keterangan Baca',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PreviewCerpenPg(urlimg: url, fullcrpn: fullcrpn, title: title,)));
      },
    );
  }
}
