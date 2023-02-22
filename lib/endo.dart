import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:simu/home_screen.dart';
import 'package:simu/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simu/QRkod.dart';
import 'package:http/http.dart' as http;

Future<void> show_code(my_url) async{
        var response = await http.post(
        Uri.parse(my_url));
    
    }

class ENDO extends StatefulWidget{
  final String nehotovy_token;
  final String? hotovy_token; // tady je můj token
  

  const ENDO({
    Key? key,
    required this.nehotovy_token,
    this.hotovy_token,
  }) : super(key: key);

  @override
  State<ENDO> createState() => _ENDOState();
}

class _ENDOState extends State<ENDO> {
    String get tok => widget.hotovy_token?? widget.nehotovy_token.split(RegExp(r'='))[1];
    TextEditingController textController = TextEditingController();


    Future<void> postData(myULR) async {
      var response = await http.post(
        Uri.parse("https://id.simu.mu/.passport/sesame/prepare?resource=lap1&session_token=$tok"));
    }


    
  @override

  Widget build(BuildContext context) {
    



    return Scaffold(
      body: 
      Stack(
        children: <Widget>[
          Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Color.fromARGB(255, 247, 11, 11)
              ),
          ),
           SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset("images/logo.png"),
                    width: 160,
                    height: 90,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "ENDO Mentor",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: <Widget>[
                      fotak(tok: tok,),
                        ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Vlož heslo ze simulátoru:",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          width: 160,
                          child: TextFormField(
                            onChanged: (val) {
                              if (val.length ==6){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            controller: textController,
                            decoration: InputDecoration(hintText: "000000"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                          SizedBox(
                          height: 10,
                          ),
                          Container(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(onPressed: () async{ 
                            final code = textController.text;
                            await show_code("https://id.simu.mu/.passport/sesame/open?resource=lap1&verification=$code&session_token=$tok");                            
                            },
                          child: const Text('Připojit přes kód'),  
                      )   
                     )
                    ],
                    )
                    ),


                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                    ),                    
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: <Widget>[
                      scanovani(tok: tok),
                        ],
                  ),
                  //Text("https://id.simu.mu/.passport/sesame/prepare?resource=lap1&session_token=$tok"),
                ],      
              ),
              
            ),
          ),
        ],
      ),
    ); 
  }  
}



class fotak extends StatelessWidget {
  final String tok;

  const fotak({
    Key? key,
    required this.tok
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context, constraint) {
        return Container(
          alignment: Alignment.bottomCenter,
          width: constraint.maxWidth -10 ,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,12),
                blurRadius: 13,
                spreadRadius: -13
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async{
                await show_code("https://id.simu.mu/.passport/sesame/prepare?resource=lap1&session_token=$tok");  
                await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>DialogExample());        
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 12, 12),
                      shape: BoxShape.circle,
                
                    ),
                    child: Icon(
                      Icons.add_to_queue,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 1),
                  Text("Připojit se k simulátoru",
                    style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0)), 
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class SimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text("Připojit se k simulátoru",
                    style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0)), 
                  ),
      content: Text("OK",
                    style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0)), 
                  ),
      actions: [
        new FloatingActionButton(onPressed:(){Navigator.of(context).pop();},
        child: Text("OK"))
      ],
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Požadavek na připojení byl odeslán'),
          content: const Text('Jakmile se na obrazovce simulátoru objeví kód, můžete jej naskenovat či opsat.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              //onPressed: () => scanQRCode(),
              child: const Text('OK'),
            ),
          ],
        );
    }
}

class scanovani extends StatelessWidget {
  const scanovani({
    Key? key,
    required this.tok
  }) : super(key: key);
  final String tok;
  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context, constraint) {
        return Container(
          alignment: Alignment.bottomCenter,
          width: constraint.maxWidth -10 ,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,-5),
                blurRadius: 13,
                spreadRadius: -7
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  scan(tok: tok)));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 12, 12),
                      shape: BoxShape.circle,
                
                    ),
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 1),
                  Text("Připojit přes QR kód",
                    style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0)), 
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}


