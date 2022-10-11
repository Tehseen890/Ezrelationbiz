import 'package:business_management/HomePages/Home/Home.dart';

import 'package:business_management/Profile/profile.dart';
import 'package:business_management/RegistrationScreens/afteremailverification.dart';

import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class OTP_verification extends StatefulWidget {
  String text;
  String? countrycode;
  OTP_verification({
    required this.text,
    Key? key,
    required this.countrycode,
  }) : super(key: key);

  @override
  State<OTP_verification> createState() => _OTP_verificationState();
}

class _OTP_verificationState extends State<OTP_verification> {
  bool isLoading = false;
  late String verificationcode;
  @override
  void initState() {
    verifyphonenumber();

    super.initState();
  }

  verifyphonenumber() async {
    print('hy');
    print('by');
    print('hello');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.countrycode! + widget.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('des');
        print('rtv');
        print('bnd');
        setState(() {
          isLoading = true;
        });
        try {
          print('yuo');
          print('prt');
          print('ggg');
          final usercredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          if (usercredential.user != null) {
            final newuser =
                usercredential.additionalUserInfo?.isNewUser ?? false;
            if (newuser == true) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AfterEmailVerification()));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            }
          }
        } catch (e) {
          print('nmd');
          print('era');
          print('lph');
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFF1FA0D0),
              content: Text(
                'Check Your internet connection',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              duration: Duration(seconds: 5),
            ),
          );
        }
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
        print('lll');
        print('opq');
        print('trp');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF1FA0D0),
            content: Text(
              'Check Your internet connection',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(seconds: 5),
          ),
        );
      },
      codeSent: (String verificationid, int? resendtoken) {
        print('tyu');
        print('nbv');
        print('klm');
        setState(() {
          verificationcode = verificationid;
        });
      },
      codeAutoRetrievalTimeout: (String verificationid) {
        setState(() {
          verificationcode = verificationid;
        });
      },
      timeout: Duration(seconds: 120),
    );
  }

  TextEditingController pinputcontroller = new TextEditingController();
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
          'OTP Verification',
          style: TextStyle(
            color: Color(0xFF1FA0D0),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/undraw_confirmed_re_sef7 1.png',
                width: 147,
                height: 174,
              ),
              SizedBox(height: 10),
              Text(
                'Check Your Phone',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We have sent OTP to',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.40),
                ),
              ),
              Text(
                '${widget.countrycode! + widget.text}',
                style: TextStyle(
                  color: Color(0xFF1FA0D0),
                ),
              ),
              SizedBox(height: 30),
              Pinput(
                controller: pinputcontroller,
                length: 6,
              ),
              SizedBox(height: 30),
              Text(
                'Resend OTP? 00:30',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.40),
                ),
              ),
              SizedBox(height: 50),
              isLoading == true
                  ? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: MediaQuery.of(context).size.width * 0.40),
                      decoration: BoxDecoration(
                        color: Color(0xFF1FA0D0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : roundedbutton(
                      buttontext: 'Next',
                      onpress: () async {
                        print('lhg');
                        print('cxv');
                        print('sda');
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          print('mvb');
                          print('rtv');
                          print('bnd');
                          final usercredential =
                              await FirebaseAuth.instance.signInWithCredential(
                            PhoneAuthProvider.credential(
                              verificationId: verificationcode,
                              smsCode: pinputcontroller.text,
                            ),
                          );
                          print('fght');
                          print('rtv');
                          print('bnd');
                          if (usercredential.user != null) {
                            final newuser =
                                usercredential.additionalUserInfo?.isNewUser ??
                                    false;
                            if (newuser == true) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AfterEmailVerification()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Profile()));
                            }
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color(0xFF1FA0D0),
                              content: Text(
                                'Check Your internet connection',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
