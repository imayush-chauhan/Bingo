import 'dart:async';
import 'dart:math';
import 'package:bingo/Ads/ads.dart';
import 'package:bingo/Data/data.dart';
import 'package:flutter/material.dart';

class Computer extends StatefulWidget {
  @override
  _ComputerState createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {

  @override
  void initState() {
    super.initState();
    computerNum();
  }

  computerNum() {
    setState(() {
      for (int i = 0; i < 25; i++) {
        Data.nandandis2[i] = "${i+1}";
      }
      Data.nandandis2.shuffle();
    });
  }

  random() {
    setState(() {
      if (Data.ab <= 25) {
        for (int i = 0; i < 25; i++) {
          Data.display[i] = "${i+1}";
        }
        Data.display.shuffle();
        Data.ab = 26;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height*.075,
            child: Row(
              children: [
                Text("BINGO",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.24,
                ),
                MaterialButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.red,
                  splashColor: Colors.black,
                  minWidth: 120,
                  height: 50.0,
                  onPressed: (){
                    if(Data.ab > 26){
                      showWinDialog("play again");
                    }else{
                      random();
                    }
                  },
                  child: Text(
                    '${Data.ab > 26 ? "Restart" : "Random"}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*.14,
            left: 0,
            height: MediaQuery
                .of(context)
                .size
                .height * .6,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                      if(Data.gameOver == false && Data.once == true){
                        _tapped(index);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700])
                      ),
                      child: Center(
                        child: Text(Data.display[index],
                          style: TextStyle(
                            color: Data.display[index] == "X" ? Colors.white : Colors
                                .red,
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
            left: Data.le ? 0 : -MediaQuery.of(context).size.width*1.2,
            height: MediaQuery
                .of(context)
                .size
                .height * .6,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Card(
              elevation: 0,
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 25,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700])
                    ),
                    child: Center(
                      child: Text(Data.nandandis2[index],
                        style: TextStyle(
                          color: Data.nandandis2[index] == "X"
                              ? Colors.white
                              : Colors.red,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*.76,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  if(Data.player){
                    ShowAds.showInterstitialAd();
                  }
                  Data.le = !Data.le;
                  Data.player = !Data.player;
                });
              },
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.red,
              splashColor: Colors.black,
              minWidth: 200,
              height: 50.0,
              child: Text(
                '${Data.player ? "computer" : "switch"}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*.86,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("B",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Data.player
                        ? Data.l >= 1 ? Colors.red : Colors.black
                        : Data.ln >= 1 ? Colors.red : Colors.black,
                  ),
                ),
                Text("I",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Data.player
                        ? Data.l >= 2 ? Colors.red : Colors.black
                        : Data.ln >= 2 ? Colors.red : Colors.black,
                  ),),
                Text("N",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Data.player
                        ? Data.l >= 3 ? Colors.red : Colors.black
                        : Data.ln >= 3 ? Colors.red : Colors.black,
                  ),),
                Text("G",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Data.player
                        ? Data.l >= 4 ? Colors.red : Colors.black
                        : Data.ln >= 4 ? Colors.red : Colors.black,
                  ),),
                Text("O",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Data.player
                        ? Data.l >= 5 ? Colors.red : Colors.black
                        : Data.ln >= 5 ? Colors.red : Colors.black,
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (Data.ab <= 25 && Data.display[index] == '') {
        Data.display[index] = "${Data.ab}";
        Data.ab++;
      } else if (Data.ab > 25 && Data.display[index] != "X") {
        Data.ab++;
        String na = Data.display[index];
        Data.display[index] = "X";
        Data.once = false;
        Data.check(index, Data.display,"d");
        if (Data.l >= 5 && Data.gameOver == false) {
          Data.gameOver = true;
          showWinDialog("win!!");
        }
        for (int i = 0; i < 25; i++) {
          if (Data.nandandis2[i] == na) {
            Data.nandandis2[i] = "X";
            Data.check(i, Data.nandandis2,"n");
            break;
          }
        }
        if (Data.ln >= 5 && Data.gameOver == false) {
          Data.gameOver = true;
          showWinDialog("lose!!");
        }
        Timer(Duration(milliseconds: 800), () {
          randomNum(index);
        });
      }
    });
  }

  randomNum(int index) {
    int z = Random().nextInt(10) + 5;
    setState(() {
      for (int i = 0; i < 25; i++) {
        if (Data.display[index + z + i <= 24 ? index + z + i : index + z + i - 24] !=
            "X") {
          setState(() {
            String na = Data.display[index + z + i <= 24 ? index + z + i : index + z +
                i - 24];
            for (int i = 0; i < 25; i++) {
              if (Data.nandandis2[i] == na) {
                Data.nandandis2[i] = "X";
                Data.check(i, Data.nandandis2,"n");
                break;
              }
            }
            if (Data.ln >= 5 && Data.gameOver == false) {
              Data.gameOver = true;
              showWinDialog("lose!!");
            }
            Data.display[index + z + i <= 24 ? index + z + i : index + z + i - 24] =
            "X";
            Data.once = true;
            Data.check(index + z + i <= 24 ? index + z + i : index + z + i - 24, Data.display,"d");
            if (Data.l >= 5 && Data.gameOver == false) {
              Data.gameOver = true;
              showWinDialog("win!!");
            }
          });
          break;
        }
      }
    });
  }

  showWinDialog(String hoo) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('$hoo')),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.red)
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
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
                    onPressed: () {
                      setState(() {
                        ShowAds.loadRewardedAd();
                        ShowAds.showRewardedAd();
                        Data.refresh();
                        computerNum();
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
