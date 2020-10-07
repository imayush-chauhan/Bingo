import 'package:flutter/material.dart';

class HowToPlay extends StatefulWidget {
  @override
  _HowToPlayState createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {

  List<String> a = [
    '',
    '',
    '',
    '',
    '',
    '',
    '5',
    '',
    '7',
    '',
    '',
    '2',
    '',
    '',
    '',
    '',

  ];

  List<String> b = [
    'X',
    '10',
    '15',
    'X',
    'X',
    '1',
    'X',
    '15',
    'X',
    'X',
    'X',
    'X',
    'X',
    '8',
    '16',
    '18',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bingo",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF5036D5),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ]
            )
        ),
        child: Stack(
          alignment: Alignment.center,
           children: [
             Positioned(
               top: 5,
               left: 30,
               child: Text(
                 ">  Fill all the squares by tapping \n"
                     "Or by clicking on Random Button\n"
                     "to fill Random numbers",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 21,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Positioned(
               top: MediaQuery.of(context).size.height*.12,
               height: MediaQuery.of(context).size.height*.26,
               width: MediaQuery.of(context).size.width*.48,
               child: Container(
                 child: Card(
                   elevation:0,
                   color: Color(0xFF5B16D0),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*.05),
                   ),
                   child: Padding(
                     padding:  EdgeInsets.all(MediaQuery.of(context).size.width*.045),
                     child: GridView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 16,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 4,
                       ),
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                           decoration: BoxDecoration(
                               border: Border.all(color: Colors.white)
                           ),
                           child: Center(
                             child: Text(a[index],
                               style: TextStyle(
                                 color: Colors.red,
                                 fontSize: 22,
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
               top: MediaQuery.of(context).size.height*.43,
               left: 30,
               child: Text(
                 ">  To win the game make\n"
                     "5 column , row , diagonal\n"
                     "X first",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 21,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Positioned(
               top: MediaQuery.of(context).size.height*.55,
               height: MediaQuery.of(context).size.height*.28,
               width: MediaQuery.of(context).size.width*.5,
               child: Container(
                 child: Card(
                   elevation:0,
                   color: Color(0xFF5B16D0),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*.05),
                   ),
                   child: Padding(
                     padding:  EdgeInsets.all(MediaQuery.of(context).size.width*.045),
                     child: GridView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 16,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 4,
                       ),
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                           decoration: BoxDecoration(
                               border: Border.all(color: Colors.white)
                           ),
                           child: Center(
                             child: Text(b[index],
                               style: TextStyle(
                                 color: b[index] == "X" ? Colors.white : Colors.red,
                                 fontSize: 22,
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
           ],
        ),
      ),
    );
  }
}
