import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simu/endo.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io' show HttpServer;
import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;
import 'package:simu/home_screen.dart';
import 'package:simu/log.dart';
import 'package:simu/splash_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginPage>{
  String value = 'token';
  String _status = '';
  @override
  void initState() {
    super.initState();
  }

  void authenticate() async {
    final url = 'https://id.simu.mu/';
    final callbackUrlScheme = 'com.auth0.simu';
    

    try {
      final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: callbackUrlScheme);
      setState(() { _status = 'Got result: $result'; });
      Navigator.pushReplacement(this.context, MaterialPageRoute(
      builder: (context) => home_screen(value: result)));
    } on PlatformException catch (e) {
      setState(() { _status = 'Got error: $e'; });
    }
    
  }

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
            GestureDetector(
                onTap: () { this.authenticate(); },

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
            ),
            Text('Status: $_status\n'),
              const SizedBox(height: 80),
          ]
        )
      )
    );
  }
}