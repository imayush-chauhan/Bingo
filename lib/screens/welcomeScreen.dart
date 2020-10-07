import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.deepPurple)
                ),
                color: Color(0xFF5036D5),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                splashColor: Colors.black,
                minWidth: 180.0,
                height: 45.0,
                child: Text(
                  'Vs friend',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.white,
                    fontFamily: 'David',
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              MaterialButton(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.deepPurple)
                ),
                color: Color(0xFF5036D5),
                onPressed: () {
                  Navigator.pushNamed(context, 'computer');
                },
                splashColor: Colors.black,
                minWidth: 180.0,
                height: 45.0,
                child: Text(
                  'Vs Computer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.white,
                    fontFamily: 'David',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
