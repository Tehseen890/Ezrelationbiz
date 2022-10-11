import 'package:business_management/Welcome/OTP_verification.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController phonenumber = new TextEditingController();
  String codee = '+92';

  final codepicker = FlCountryCodePicker();

  CountryCode? countrycode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Ez Business Management.png'),
              SizedBox(height: 50),
              Text(
                'Welcome!',
                style: TextStyle(
                    color: Color(0xFF1FA0D0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur elit lectus adipiscing lectus augue penatibus eros mass.'),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: Colors.black,
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () async {
                      final code =
                          await codepicker.showPicker(context: context);
                      setState(() {
                        codee = code!.dialCode;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      //   padding: EdgeInsets.only(top: 25,),
                      decoration: BoxDecoration(
                        color: Color(0xFF1FA0D0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        codee,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                controller: phonenumber,
              ),
              SizedBox(height: 40),
              roundedbutton(
                  buttontext: 'Continue',
                  onpress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTP_verification(
                              text: phonenumber.text,
                              countrycode: codee,
                            )));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
