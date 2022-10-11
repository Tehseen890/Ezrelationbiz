import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/BusinessModel.dart';
import 'package:business_management/Profile/profile.dart';

import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessInfo extends StatefulWidget {
  String FullName, Email, Password, Family, Address, City, ZipCode;
  BusinessInfo({
    required this.FullName,
    required this.Email,
    required this.Password,
    required this.Family,
    required this.City,
    required this.Address,
    required this.ZipCode,
  });

  @override
  State<BusinessInfo> createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  bool isLoading = false;

  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;

  TextEditingController Businessname = new TextEditingController();

  TextEditingController BussinesWebsite = new TextEditingController();

  TextEditingController BusinessNumber = new TextEditingController();

  var adddetails = UserModel();

  var addbusiness = AddBusinessModel();

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Business info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF1FA0D0),
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: Businessname,
                decoration: InputDecoration(
                  hintText: 'Business name',
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
                controller: BussinesWebsite,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Business Website (Optional)',
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
                controller: BusinessNumber,
                decoration: InputDecoration(
                  hintText: 'Business Number',
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
                      buttontext: 'Welcome',
                      onpress: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Provider.of<Users>(context, listen: false)
                            .addaccounttype(phoneNo, 'Business');
                        adddetails = UserModel(
                          id: phoneNo,
                          FullName: widget.FullName,
                          Email: widget.Email,
                          Password: widget.Password,
                          family: widget.Family,
                          Address: widget.Address,
                          City: widget.City,
                          ZipCode: widget.ZipCode,
                          BusinessName: Businessname.text,
                          BusinessWebsite: BussinesWebsite.text,
                          BusinessNumber: BusinessNumber.text,
                        );
                        await Provider.of<Users>(context, listen: false)
                            .addBusinessDetail(adddetails);
                        addbusiness = AddBusinessModel(
                          businessid: phoneNo,
                          FullName: widget.FullName,
                          Email: widget.Email,
                          Password: widget.Password,
                          family: widget.Family,
                          Address: widget.Address,
                          City: widget.City,
                          ZipCode: widget.ZipCode,
                          BusinessName: Businessname.text,
                          BusinessWebsite: BussinesWebsite.text,
                          BusinessNumber: BusinessNumber.text,
                        );
                        await Provider.of<BusinessList>(context, listen: false)
                            .addBusinesses(phoneNo, addbusiness);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
                      },
                    ),
            ],
          ),
        )),
      ),
    );
  }
}
