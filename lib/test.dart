import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simu/endo.dart';


class scan extends StatefulWidget {
  const scan({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<scan> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<scan> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
     setState(() {
       result = event;
     });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: QRView(
                  key: _gLobalkey,
                  onQRViewCreated: qr
              ),
            ),
            Center(
              child: (result !=null) ? Text('${result!.code}') : Text('Scan a code'),
            ),
            ElevatedButton(
                    child: const Text('Připojit'),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  ENDO()));
                      // Navigate to second route when tapped.
                    },
              ),
          ],
        ),
      ),
    );
  }
}