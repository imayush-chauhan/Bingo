import 'package:bingo/Data/data.dart';
import 'package:bingo/Data/homeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bingo/Ads/ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  AnimationController controller;
  Animation animationColor;
  Animation animationColor2;
  Animation animationColor3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    animationColor = ColorTween(begin: Color(0xFF5f42f5), end: Color(0xFF5036D5)).animate(controller);
    animationColor2 = ColorTween(begin: Color(0xFF5f42f5), end: Colors.deepPurple).animate(controller);
    animationColor3 = ColorTween(begin: Colors.transparent, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener((){
      setState(() {});
    });
    ShowAds.showBannerAd();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.3,0.7,0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ]
            )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -MediaQuery.of(context).size.width*(1.5/1.6),
              left: -MediaQuery.of(context).size.width*(1.5/5.6),
              child: Container(
                height: MediaQuery.of(context).size.width*1.5,
                width: MediaQuery.of(context).size.width*1.5,
                decoration: BoxDecoration(
                  color: Color(0xFF5036D5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.115,
              child: Text(
                "BINGO",
                style: TextStyle(
                  color: animationColor3.value,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.38,
              child: Column(
                children: [
                  MaterialButton(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: animationColor2.value)
                    ),
                    color: animationColor.value,
                    onPressed: () {
                      Navigator.pushNamed(context, 'welcome');
                      setState(() {
                        HomeData.refresh();
                        Data.refresh();
                        HomeData.name = false;
                        HomeData.ply1 = "Player1";
                        HomeData.ply2 = "Player2";
                      });
                    },
                    splashColor: Colors.black,
                    minWidth: 180.0,
                    height: 45.0,
                    child: Text(
                      'NEW GAME',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: animationColor3.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: animationColor2.value)
                    ),
                    color: animationColor.value,
                    onPressed: () {
                      Navigator.pushNamed(context, 'computer');
                    },
                    splashColor: Colors.black,
                    minWidth: 180.0,
                    height: 45.0,
                    child: Text(
                      'PRACTICE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: animationColor3.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: animationColor2.value)
                    ),
                    color: animationColor.value,
                    onPressed: () {
                      Navigator.pushNamed(context, 'how');
                    },
                    splashColor: Colors.black,
                    minWidth: 180.0,
                    height: 45.0,
                    child: Text(
                      'HOW TO PLAY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: animationColor3.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
