import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simu/endo.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io' show HttpServer;
import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;



class log_test extends StatefulWidget {
  @override
  State<log_test> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<log_test> {
  String _status = '';

  @override
  void initState() {
    super.initState();
    //startServer();
  }
/*
  Future<void> startServer() async {
    final server = await HttpServer.bind('127.0.0.1', 43823);

    server.listen((req) async {
      setState(() { _status = 'Received request!'; });

      req.response.headers.add('Content-Type', 'text/html');
      req.response.close();
    });
  }
*/
  void authenticate() async {
    final url = 'https://id.simu.mu/';
    final callbackUrlScheme = 'com.auth0.simu';
    

    try {
      final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: callbackUrlScheme);
      setState(() { _status = 'Got result: $result'; });
    } on PlatformException catch (e) {
      setState(() { _status = 'Got error: $e'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Status: $_status\n'),
              const SizedBox(height: 80),
              ElevatedButton(
                child: Text('Authenticate'),
                onPressed: () { this.authenticate(); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}