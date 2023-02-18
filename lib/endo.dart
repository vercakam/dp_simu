import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:simu/home_screen.dart';
import 'package:simu/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simu/QRkod.dart';

class ENDO extends StatelessWidget{
  final String value; // tady je můj token

  const ENDO({
    Key? key,
    required this.value,
  }) : super(key: key);


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
                      fotak(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1){},
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 40,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length ==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(hintText: "0"),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                    ],
                    )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: <Widget>[
                      scanovani(),
                        ],
                  ),
                  Text(value),
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
  bool isVisible = false;
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
              onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) =>DialogExample()),
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
  bool isVisible = false;
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
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  scan(title: 'scan',)));
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
                  Text("Načti QR kód",
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
/*
Future<void> scanQRCode() async {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      /*if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }*/
  }
*/


/*
class Lectures extends StatefulWidget {
  @override
  _LStepperState createState() => _LStepperState();
  
}
class _LStepperState extends State<Lectures> {
  @override
  int  currentStep = 0;
  Widget build(BuildContext context) {
    return Container(
        child: Stepper(
        currentStep: this.currentStep,
        steps: mySteps,
        type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep = currentStep - 1;
            } else {
              currentStep = 0;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentStep < mySteps.length - 1) {
              currentStep = currentStep + 1;
            } else {
              currentStep = 0;
            }
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
            final _isLastStep = currentStep == mySteps.length - 1;
            return Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(children: [
                  if (currentStep !=  mySteps.length - 1)
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            child: Text('Další lekce'), 
                            onPressed: details.onStepContinue)),
                    const SizedBox(
                      width: 12,
                    ),
                  if (currentStep != 0)
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 162, 152, 151))),
                            child: Text('Minulá lekce'),
                            onPressed: details.onStepCancel),
                            ),
                ]));
          },
      ),
      
      );
  }
  // init the step to 0th position
  List<Step> mySteps = [
    Step(title: Text("Lekce 1"), 
        content: Text("ESSENTIAL BRONCHOSCOPY MODULE"), 
        isActive: true),
    Step(
        title: Text("Lekce 2"),
        content: Text("DIAGNOSTIC BRONCHOSCOPY MODULE"),
        isActive: true
        ),
    Step(
        title: Text("Lekce 3"),
        content: Text("PEMERGENCY BRONCHOSCOPY MODULE"),
        isActive: false),
    Step(
        title: Text("Lekce 4"),
        content: Text("ESSENTIAL EBUS"),
        isActive: false),
    Step(title: Text("Lekce 5"), 
        content: Text("CHEST STANDARDIZED CURRICULUM"), 
        isActive: false),
  ];
  
}*/