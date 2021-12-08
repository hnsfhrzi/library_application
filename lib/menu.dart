import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_application/previewcerpen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'bottomnavbar.dart';

class mainMenu extends StatelessWidget {
  const mainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDEDB8),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
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
      bottomNavigationBar: BottomNav(),
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
                          ListGenre(),
                          ListGenre(),
                          ListGenre(),
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
                        children: [
                          ListRecent(),
                          ListRecent(),
                          ListRecent(),
                        ],
                      ),
                    ),
                  ),
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
  const ListGenre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 90,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.grey[400],
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
  const ListRecent({Key? key}) : super(key: key);

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
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Title',
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
            MaterialPageRoute(builder: (context) => PreviewCerpenPg()));
      },
    );
  }
}
