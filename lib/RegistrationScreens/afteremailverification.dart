import 'package:business_management/RegistrationScreens/afterprovidingnameandpassword.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:flutter/material.dart';

class AfterEmailVerification extends StatefulWidget {
  AfterEmailVerification({Key? key}) : super(key: key);

  @override
  State<AfterEmailVerification> createState() => _AfterEmailVerificationState();
}

class _AfterEmailVerificationState extends State<AfterEmailVerification> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = new TextEditingController();
    TextEditingController Email = new TextEditingController();
    TextEditingController Password = new TextEditingController();
    return Scaffold(
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
                'Add your details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF1FA0D0),
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: fullname,
                decoration: InputDecoration(
                  hintText: 'Full Name',
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
                controller: Email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
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
                controller: Password,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    },
                    icon: Icon(obsecure
                        ? Icons.visibility_off
                        : Icons.visibility_outlined),
                  ),
                ),
              ),
              SizedBox(height: 15),
              roundedbutton(
                buttontext: 'Next',
                onpress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AfterProvidingName(
                        Fullname: fullname.text,
                        Email: Email.text,
                        Password: Password.text,
                      ),
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



// class roundedtextfield extends StatelessWidget {
//   final Widget child;
//   const roundedtextfield({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width * 0.8,
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.grey[300],
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: child,
//     );
//   }
// }
