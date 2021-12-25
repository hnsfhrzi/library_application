import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:library_application/cerpen/settingsave.dart';

class settingsPg extends StatefulWidget {
  const settingsPg({Key? key}) : super(key: key);

  @override
  _settingsPgState createState() => _settingsPgState();
}

class _settingsPgState extends State<settingsPg> {

  //List<double> savefont = [];
  double value = saveset[0].currentvaluefont;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
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
            'Setting',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                        child: Text(
                            'Font Size',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal : MediaQuery.of(context).size.width/10),
                        child: Slider(
                          value: value,
                          min: 12,
                          max: 30,
                          divisions: 9,
                          inactiveColor: Color(0xFFC4C4C4),
                          activeColor: Color(0xFFD3E49C),
                          label: value.toString(),
                          onChanged: (value) => setState(() => this.value = value),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
       )
    );
  }
}