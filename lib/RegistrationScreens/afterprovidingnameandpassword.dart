import 'package:business_management/Models/BusinessModel.dart';

import 'package:business_management/Profile/profile.dart';
import 'package:business_management/RegistrationScreens/BusinessInfo.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterProvidingName extends StatefulWidget {
  String Fullname, Email, Password;

  AfterProvidingName({
    Key? key,
    required this.Fullname,
    required this.Email,
    required this.Password,
  }) : super(key: key);

  @override
  State<AfterProvidingName> createState() => _AfterProvidingNameState();
}

class _AfterProvidingNameState extends State<AfterProvidingName> {
  bool isLoading = false;

  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;

  UserModel adddetails = UserModel();

  TextEditingController Family = new TextEditingController();

  TextEditingController Address = new TextEditingController();

  TextEditingController City = new TextEditingController();

  TextEditingController ZipCode = new TextEditingController();

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
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Form(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add your Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF1FA0D0),
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: Family,
                decoration: InputDecoration(
                  hintText: 'Family',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: Address,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Address',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: City,
                decoration: InputDecoration(
                  hintText: 'City',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: ZipCode,
                decoration: InputDecoration(
                  hintText: 'Zip code',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              isLoading == true
                  ? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: MediaQuery.of(context).size.width * 0.40,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF1FA0D0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : roundedbutton(
                      buttontext: 'Continue and make my business',
                      onpress: () {
                        // Provider.of<business>(context, listen: false)
                        //     .continuewithbusiness(true);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BusinessInfo(
                              FullName: widget.Fullname,
                              Email: widget.Email,
                              Password: widget.Password,
                              Family: Family.text,
                              City: City.text,
                              Address: Address.text,
                              ZipCode: ZipCode.text,
                            ),
                          ),
                        );
                      }),
              Container(
                alignment: Alignment.center,
                child: isLoading == true
                    ? CircularProgressIndicator(
                        color: Color(0xFF1FA0D0),
                      )
                    : TextButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await Provider.of<Users>(context, listen: false)
                              .addaccounttype(phoneNo, 'Client');
                          // Provider.of<business>(context, listen: false)
                          //     .continuewithbusiness(false);
                          adddetails = UserModel(
                            id: phoneNo,
                            FullName: widget.Fullname,
                            Email: widget.Email,
                            Password: widget.Password,
                            family: Family.text,
                            City: City.text,
                            Address: Address.text,
                            ZipCode: ZipCode.text,
                          );
                          await Provider.of<Users>(context, listen: false)
                              .addClientDetail(adddetails);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        child: Text(
                          'Continue without making my business',
                          style: TextStyle(
                            color: Color(0xFF1FA0D0),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        )),
      ),
    );
    ;
  }
}
