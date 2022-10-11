import 'package:business_management/Models/BusinessModel.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR_code extends StatefulWidget {
  QR_code({Key? key}) : super(key: key);

  @override
  State<QR_code> createState() => _QR_codeState();
}

class _QR_codeState extends State<QR_code> {
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  @override
  Widget build(BuildContext context) {
    final loadeddata = Provider.of<Users>(context, listen: false).Userdata;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF2F5FC),
            ),
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: QrImage(
                data: phoneNo.toString(),
                size: 200,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Scan QR code or',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Text(
            'Send code to client',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OTP_textfield(),
              OTP_textfield(),
              OTP_textfield(),
              OTP_textfield(),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: roundedbutton(buttontext: 'Send Code', onpress: () {}),
          ),
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
      //  padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(5),
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        color: Color(0xFFF2F5FC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
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
