import 'package:flutter/material.dart';

class favoritePage extends StatelessWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          //Nama Page
          'Favorite',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        //Untuk background
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          //Kotak Warna hijau
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width/17, left: MediaQuery.of(context).size.width/17,
              top: MediaQuery.of(context).size.height/8, bottom: MediaQuery.of(context).size.height/17
          ),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.55),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0xFFD3E49C),
                width: 3,
              ),
            ),
            child: GridView.count(
              //Bentuk grid view
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: EdgeInsets.all(20),
              childAspectRatio: 5 / 8,
              children: [
                listFavorite(),
                listFavorite(),
                listFavorite(),
                listFavorite(),
                listFavorite(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Container list Favorite
class listFavorite extends StatelessWidget {
  const listFavorite({Key? key}) : super(key: key);

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
            "title",
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
