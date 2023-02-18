import 'package:flutter/material.dart';
import 'package:simu/auth.dart';
import 'package:simu/home_screen.dart';
import 'package:simu/log_page.dart';
import 'package:simu/splash_screen.dart';
import 'package:simu/auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:simu/log.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen>{
  String value = 'token';
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() { 
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Color.fromARGB(255, 247, 11, 11),
                /*gradient: LinearGradient(
                  colors: [
                    (Color.fromARGB(255, 196, 7, 7)),( Color.fromARGB(255, 226, 104, 104)),
                  ]
                )*/
              ),
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset("images/logo.png"),
                    width: 190,
                    height: 90,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Přihlásit",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white

                      ),
                    ),
                  )
                ],
              ),
             ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 249, 242, 242),
                boxShadow: [BoxShadow(
                  offset: Offset(0,5),
                  blurRadius: 20,
                  color: Color.fromARGB(255, 180, 173, 173)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: "Zadej mail",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 249, 242, 242),
                boxShadow: [BoxShadow(
                  offset: Offset(0,5),
                  blurRadius: 20,
                  color: Color.fromARGB(255, 180, 173, 173)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.key,
                    color: Colors.black,
                  ),
                  hintText: "Zadej heslo",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  home_screen(value: value)
                  ));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                alignment: Alignment.center,
                height: 50,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (Color.fromARGB(255, 255, 0, 0)), (Color.fromARGB(255, 231, 13, 13)),
                    ]),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color: Color.fromARGB(255, 215, 215, 215)
                  )],
                ),
                child: Text(
                  "Přihlásit",
                  style: TextStyle(
                    color: Colors.white,
                    ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginPage()));},

              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 150),
                alignment: Alignment.center,
                height: 50,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (Color.fromARGB(255, 255, 0, 0)), (Color.fromARGB(255, 231, 13, 13)),
                    ]),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color: Color.fromARGB(255, 215, 215, 215)
                  )],
                ),
                child: Text(
                  "Přihlásit přes MUNI ID",
                  style: TextStyle(
                    color: Colors.white,
                    ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}