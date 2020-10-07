import 'dart:async';
import 'package:bingo/Ads/ads.dart';
import 'package:bingo/Data/homeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final nameKey = GlobalKey<ScaffoldState>();

  _randomNumber(){
    setState(() {
      if(HomeData.ab <= 25){
        for(int i = 0; i < 25; i++){
          HomeData.display[i] = "${i+1}";
        }
        HomeData.display.shuffle();
        HomeData.ab = 26;
      }
    });
  }

  _randomNumber2(){
    setState(() {
      if(HomeData.ab2 <= 25){
        for(int i = 0; i < 25; i++){
          HomeData.nandandis2[i] = "${i+1}";
        }
        HomeData.nandandis2.shuffle();
        HomeData.ab2 = 26;
      }
    });
  }

  snackBar(String s){
    SnackBar snackbar = SnackBar(duration: Duration(milliseconds: 1800), content: Text(s));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        setState(() {
          HomeData.name = true;
        });
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[800],
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*.07,
              child: Row(
                children: [
                  Text(HomeData.player ? HomeData.ply1 : HomeData.ply2,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.22,
                  ),
                  MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.red,
                    splashColor: Colors.black,
                    minWidth: 120,
                    height: 50,
                    onPressed: () {
                      if(HomeData.name == true){
                        if(HomeData.ab > 26 || HomeData.ab2 > 26){
                          _showWinDialog("Restart");
                        }else{
                          if(HomeData.player){
                            _randomNumber();
                          }else{
                            _randomNumber2();
                          }
                        }
                      }
                    },
                    child: Text(
                      '${HomeData.ab > 26 || HomeData.ab2 > 26 ? "Restart" : "Random" }',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                        // fontFamily: 'David',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.14,
              height: MediaQuery.of(context).size.height*.6,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 25,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if(HomeData.gameOver == false && HomeData.name == true){
                          setState(() {
                            _tapped(index);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[700])
                        ),
                        child: Center(
                          child: Text( HomeData.display[index],
                            style: TextStyle(
                              color: HomeData.display[index] == "X" ? Colors.white : Colors.red,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.14,
              left: HomeData.le ? 0 : -MediaQuery.of(context).size.width*1.2,
              height: MediaQuery.of(context).size.height*.6,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Card(
                  elevation:0,
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 25,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if(HomeData.gameOver == false && HomeData.name == true){
                              setState(() {
                                _tapped2(index);
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[700])
                            ),
                            child: Center(
                              child: Text(HomeData.nandandis2[index],
                                style: TextStyle(
                                  color: HomeData.nandandis2[index] == "X" ? Colors.white : Colors.red,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top:  HomeData.ab < 27 || HomeData.ab2 < 27 ? MediaQuery.of(context).size.height*.8 : -100,
              child:   MaterialButton(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red,
                splashColor: Colors.black,
                minWidth: 240,
                height: 48,
                onPressed: (){
                  if(HomeData.name == true){
                    setState(() {
                      HomeData.switchPlayers = !HomeData.switchPlayers;
                    });
                  }
                },

                child: Text(
                  'Switch to ${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply1}"}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: HomeData.ab < 27 || HomeData.ab2 < 27 ? MediaQuery.of(context).size.height*.9 : MediaQuery.of(context).size.height*.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("B",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: HomeData.player ? HomeData.l >= 1 ? Colors.red : Colors.black : HomeData.ln >= 1 ? Colors.red : Colors.black,
                    ),
                  ),
                  Text("I",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: HomeData.player ? HomeData.l >= 2 ? Colors.red : Colors.black : HomeData.ln >= 2 ? Colors.red : Colors.black,
                    ),),
                  Text("N",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: HomeData.player ? HomeData.l >= 3 ? Colors.red : Colors.black : HomeData.ln >= 3 ? Colors.red : Colors.black,
                    ),),
                  Text("G",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: HomeData.player ? HomeData.l >= 4 ? Colors.red : Colors.black : HomeData.ln >= 4 ? Colors.red : Colors.black,
                    ),),
                  Text("O",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: HomeData.player ? HomeData.l >= 5 ? Colors.red : Colors.black : HomeData.ln >= 5 ? Colors.red : Colors.black,
                    ),),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              curve: Curves.easeInOut,
              top: 0,
              right: HomeData.switchPlayers ? -MediaQuery.of(context).size.width : 0,
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1,0.4,0.7,0.9],
                          colors: [
                            Color(0xFF3594DD),
                            Color(0xFF4563DB),
                            Color(0xFF5036D5),
                            Color(0xFF5B16D0),
                          ]
                      )
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.deepPurple)
                          ),
                          color: Color(0xFF5036D5),
                          onPressed: () {
                            setState(() {
                              HomeData.once = true;
                              HomeData.switchPlayers = !HomeData.switchPlayers;
                              HomeData.le = !HomeData.le;
                              HomeData.player = !HomeData.player;
                            });
                          },
                          splashColor: Colors.black,
                          minWidth: 240,
                          height: 45.0,
                          child: Text(
                            'Switch to ${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply1}"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width*.82,
              height: MediaQuery.of(context).size.height*.45,
              left: HomeData.name == false ? MediaQuery.of(context).size.width*.09 : -MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    HomeData.name = false;
                  });
                },
                child: Card(
                  color: Colors.grey[200],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Center(
                    child: Form(
                      key: nameKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                maxLength: 8,
                                controller: textController,
                                decoration: InputDecoration(
                                  labelText: "Player1",
                                  focusColor: Colors.purple,
                                  border: OutlineInputBorder(
                                    gapPadding: 7,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: textController.clear,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                onChanged: (value){
                                  setState(() {
                                    if(value.isEmpty || value.length < 3){
                                      HomeData.ply1 = "Player1";
                                    }else{
                                      HomeData.ply1 = value.trim();
                                    }
                                  });
                                },
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                maxLength: 8,
                                controller: textController2,
                                decoration: InputDecoration(
                                  labelText: "Player2",
                                  border: OutlineInputBorder(
                                    gapPadding: 7,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: textController2.clear,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                onChanged: (value){
                                  setState(() {
                                      if(value.isEmpty || value.length < 3){
                                        HomeData.ply2 = "Player2";
                                      }else{
                                        HomeData.ply2 = value.trim();
                                      }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: MaterialButton(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                ),
                                color: Colors.red,
                                onPressed: () {
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  setState(() {
                                    HomeData.name = true;
                                  });
                                },
                                splashColor: Colors.black,
                                minWidth: MediaQuery.of(context).size.width*.2,
                                height: 45.0,
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                    // fontFamily: 'David',
                                  ),
                                ),
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (HomeData.ab <= 25 && HomeData.display[index] == '') {
        HomeData.display[index] = "${HomeData.ab}";
        HomeData.ab++;
      } else if (HomeData.ab > 25 && HomeData.display[index] != "X"){
        if(HomeData.once == false){
          snackBar("${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply1}"} turn");
        }
        for(int i = 0; i < 25; i++){
          if(HomeData.nandandis2[i] == HomeData.display[index] && HomeData.once == true){
            setState(() {
              HomeData.ab++;
              HomeData.once = false;
              HomeData.display[index] = "X";
              HomeData.check(index, HomeData.display, "d");
              if(HomeData.l >= 5 && HomeData.gameOver == false){
                HomeData.gameOver = true;
                _showWinDialog(HomeData.ply1 + " win");
              }
              HomeData.nandandis2[i] = "X";
              HomeData.check(i, HomeData.nandandis2, "n");
              if(HomeData.ln >= 5 && HomeData.gameOver == false){
                HomeData.gameOver = true;
                _showWinDialog(HomeData.ply2 + " win");
              }
              Timer(Duration(milliseconds: 1000), () {
                setState(() {
                    HomeData.switchPlayers = !HomeData.switchPlayers;
                });
              });
            });
            break;
          }else if(i == 24){
            snackBar("${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply2}"} is not ready");
            break;
          }
        }
        if(HomeData.ab == 30){
          ShowAds.showInterstitialAd();
        }
      }
    });
  }

  void _tapped2(int index){
    setState(() {
      if (HomeData.ab2 <= 25 && HomeData.nandandis2[index] == '') {
        HomeData.nandandis2[index] = "${HomeData.ab2}";
        HomeData.ab2++;
      } else if (HomeData.ab2 > 25 && HomeData.nandandis2[index] != "X"){
        if(HomeData.once == false){
          snackBar("${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply1}"} turn");
        }
        for(int i = 0; i < 25; i++){
          if(HomeData.display[i] == HomeData.nandandis2[index] && HomeData.once == true){
            setState(() {
              HomeData.ab2++;
              HomeData.once = false;
              HomeData.nandandis2[index] = "X";
              HomeData.check(index, HomeData.nandandis2, "n");
              if(HomeData.ln >= 5 && HomeData.gameOver == false){
                HomeData.gameOver = true;
                _showWinDialog(HomeData.ply2 + " win");
              }
              HomeData.display[i] = "X";
              HomeData.check(i, HomeData.display, "d");
              if(HomeData.l >= 5 && HomeData.gameOver == false){
                HomeData.gameOver = true;
                _showWinDialog(HomeData.ply1 + " win");
              }
              Timer(Duration(milliseconds: 1000), () {
                setState(() {
                    HomeData.switchPlayers = !HomeData.switchPlayers;
                });
              });
            });
            break;
          }else if(i == 24){
            snackBar("${HomeData.player ? "${HomeData.ply2}" : "${HomeData.ply2}"} is not ready");
            break;
          }
        }
        if(HomeData.ab2 == 35){
          ShowAds.showInterstitialAd();
        }
      }
    });
  }

  _showWinDialog(String hoo) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(child: Text('$hoo')),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.red)
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("cancel",
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xff151515),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.12,
                  ),
                  MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.red,
                    splashColor: Colors.black,
                    minWidth: 120,
                    height: 50.0,
                    onPressed: (){
                          setState(() {
                            ShowAds.loadRewardedAd();
                            ShowAds.showRewardedAd();
                            HomeData.refresh();
                            Navigator.of(context).pop();
                          });
                    },
                    child: Text(
                      'Restart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}