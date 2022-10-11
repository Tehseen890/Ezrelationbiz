import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/AddClients.dart';
import 'package:business_management/Models/BusinessModel.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  int counter = 0;
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  final GlobalKey qrkey = GlobalKey();
  QRViewController? controller;
  String? result;
  AddBusinessModel businesforuser = AddBusinessModel();

  void qrOnCreated(QRViewController? controller) {
    this.controller = controller;
    controller?.scannedDataStream.listen((event) async {
      counter++;
      await controller.pauseCamera();
      if (counter == 1) {
        setState(() {
          result = event.code;
          final data = Provider.of<Users>(context, listen: false).Userdata;
          businesforuser = Provider.of<Users>(context, listen: false)
              .fetchbusinesforuser(result);
          Provider.of<BusinessList>(context)
              .addBusinesses(phoneNo, businesforuser);

          AddClients client = AddClients(
            clientid: result,
            FullName: data.FullName,
            Email: data.Email,
            Password: data.Password,
            family: data.family,
            Address: data.Address,
            City: data.City,
            ZipCode: data.ZipCode,
          );
          Provider.of<ClientsList>(context, listen: false)
              .addClients(result, client);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF1FA0D0),
            content: Text(
              'Business Added',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
    });
  }

  // @override
  // void reassemble() async {
  //   super.reassemble();
  //   if (Platfo) {
  //     await controller?.pauseCamera();
  //   }
  //   controller?.resumeCamera();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xFFF2F5FC),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/Vector (2).png'),
          ),
        ),
        title: Text(
          'Scan',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300,
            width: 300,
            child: QRView(
              key: qrkey,
              onQRViewCreated: qrOnCreated,
              overlay: QrScannerOverlayShape(
                cutOutHeight: 150,
                cutOutWidth: 150,
                //  cutOutSize: 50,
                borderWidth: 10,
                borderLength: 20,
                borderRadius: 10,
                borderColor: Color(0xFF1FA0D0),
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 30),
                  child: Divider(),
                ),
              ),
              Text(result != null ? '$result' : 'OR ENTER CODE'),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 30, left: 10),
                  child: Divider(),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OTP_textfield(),
              OTP_textfield(),
              OTP_textfield(),
              OTP_textfield(),
            ],
          ),
          SizedBox(height: 30),
          roundedbutton(
              buttontext: 'Next',
              onpress: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}

class OTP_textfield extends StatelessWidget {
  const OTP_textfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        color: Color(0xFFF2F5FC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
