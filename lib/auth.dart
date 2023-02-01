import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simu/home_screen.dart';
import 'package:simu/login_screen.dart';


final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();


///  ------------------------------
///     Auth Variables
///  ------------------------------
const AUTH0_DOMAIN = 'dev-imfgzt5hobnpp1d5.us.auth0.com';
const AUTH0_CLIENT_ID = 'FNHVnmzKXu8QyBmnWTiWdLcnccqvtsL2';

const AUTH0_REDIRECT_URI = 'com.auth0.simu://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';



///  -----------------------------
///    Profile Widget
///  -----------------------------
class Profile extends StatelessWidget {
  final logoutAction;
  final String? name;
  final String? picture;

  Profile({this.logoutAction, this.name, this.picture});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height:150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width:4.0),
            shape: BoxShape.circle,
            image:DecorationImage(
              fit:BoxFit.fill,
              image: NetworkImage(picture ?? ''),
            )
          ),
        ),
        SizedBox(height: 24.0,),
        Text('Name: $name'),
        SizedBox(height: 48.0,),
        FloatingActionButton(
          onPressed: () {
            logoutAction();
          },
          child: Text('Logout'),
        ),
        ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) =>  home_screen()));
            // Navigate to second route when tapped.
          },
        ),
      ]
    );
  }
}


///  ----------------------------
///       Login Widget 
///   ---------------------------
class Login extends StatelessWidget {
  final loginAction;
  final String? loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            loginAction();
          },
          child: Text('Přihlásit'),
          
        

        ),
        Text(loginError ?? ''),
      ],
    );
  }
}



///  ----------------------------
///           App
///  ----------------------------

class autentizace extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


///  ----------------------------
///          App State 
///  ----------------------------
class _MyAppState extends State<autentizace> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  String? name;
  String? picture;

  @override
  Widget build(BuildContext context ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'Auth0 Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Auth0 Demo'),
        ),
        body: Center(
          child: isBusy
            ? CircularProgressIndicator()
            : isLoggedIn
                ? Profile(logoutAction: logoutAction, name:name,picture: picture)
                : Login(loginAction, errorMessage),
        )
      )
    );
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
    );
  }

  Future<Map> getUserDetails(String accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details.');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';


    });

    try {
      final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID, 
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
          ),
      );


      final idToken = parseIdToken(result!.idToken.toString());
      final profile = await getUserDetails(result.accessToken.toString());

      await secureStorage.write(
        key: 'refresh_token', value:result.refreshToken
      );

      setState((){
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];


      });
  
    } catch(e,s) {
      print('Login error $e-stack:$s');
      setState((){
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });

    }

  }

  void logoutAction() async {
    await secureStorage.delete(key:'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState(){
    initAction();
    super.initState();
  }


  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key:'refresh_token');
    if(storedRefreshToken == null) return;

    setState(() {
        isBusy = true;
    });

    try {
      final response = await appAuth.token(
        TokenRequest(
          AUTH0_CLIENT_ID, 
          AUTH0_REDIRECT_URI,
          issuer: AUTH0_ISSUER,
          refreshToken: storedRefreshToken,
          )
      );

      final idToken = parseIdToken(response!.idToken.toString());
      final profile = await getUserDetails(response!.accessToken.toString());

      secureStorage.write(key:'refresh_token',value:response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        name = idToken['name'];
        picture = profile['picture'];

      });

    } catch(e,s){
      print('error on refreseh token: $e - stack $s');
      logoutAction();

    }

  }


}