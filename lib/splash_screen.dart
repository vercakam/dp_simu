import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simu/login_screen.dart';


class SplashScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen1> {
  @override InitState() {
    super.initState();
    startTimer();
  }
  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, loginRoute);
  }
  loginRoute() {
    Navigator.pushReplacement(this.context, MaterialPageRoute(
      builder: (context) => LoginScreen()));
  }
  @override
  Widget build(BuildContext context) { 
    return initWidget();
  }
}


  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
             decoration: BoxDecoration(
              color: Color.fromARGB(255, 207, 29, 13),
              gradient: LinearGradient(
                colors: [(Color.fromARGB(255, 191, 12, 12)),(Color.fromARGB(255, 242, 30, 30))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
             ),
          ),
          Center(
            child: Container(
              child: Image.asset("images/logo.png"),
            ),          
          ),        
        ],
      ),
    );
  }