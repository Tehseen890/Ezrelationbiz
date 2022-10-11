import 'package:business_management/BusinessDetailPages/Services.dart';
import 'package:business_management/Models/ServicesModel.dart';
import 'package:business_management/Widgets/ImagepickerWidget.dart';
import 'package:business_management/Widgets/ReusableBox.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:business_management/Widgets/imageAlertDialoge.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CreateServices extends StatefulWidget {
  static const routemane = '/CreateService';
  CreateServices({Key? key}) : super(key: key);

  @override
  State<CreateServices> createState() => _CreateServicesState();
}

class _CreateServicesState extends State<CreateServices> {
  final _Form = GlobalKey<FormState>();
  var initvalue = {
    'Servicename': '',
    'Description': '',
    'Price': '',
    'imgurl': '',
  };
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  ImagepickerWidget imagepicked = ImagepickerWidget();
  // late TextEditingController servicename =
  //     TextEditingController(text: '${initvalue['Servicename']}');
  // late TextEditingController description =
  //     TextEditingController(text: '${initvalue['Description']}');
  // late TextEditingController price =
  //     TextEditingController(text: '${initvalue['Price']}');
  ServiceModel servicedata = ServiceModel();
  String? imgurl = null;

  var editservice = ServiceModel();
  var _isinit = true;
  @override
  void didChangeDependencies() async {
    if (ModalRoute.of(context)!.settings.arguments.runtimeType == bool) {
      _isinit = false;
    } else {
      _isinit = true;
    }
    if (_isinit) {
      final serviceid = ModalRoute.of(context)?.settings.arguments as String?;
      editservice = await Provider.of<services>(context)
          .items
          .firstWhere((element) => element.id == serviceid);

      initvalue = {
        'Servicename': editservice.servicename.toString(),
        'Description': editservice.description.toString(),
        'Price': editservice.price.toString(),
        'imgurl': '',
      };
      //   imgurl = editservice.imgurl;
      setState(() {});
    }

    super.didChangeDependencies();
  }

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
          'Create Services',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  reusablebox(
                    height: 0.3,
                    child: imgurl != null
                        ? Image.network(
                            '$imgurl',
                            fit: BoxFit.fill,
                          )
                        : Column(
                            children: [
                              SizedBox(height: 50),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return imageAlertDialoge(
                                        onpressCamera: () async {
                                          imgurl = await imagepicked
                                              .imagetakenCamera(phoneNo);
                                          Navigator.of(context).pop();
                                          editservice = ServiceModel(
                                            id: editservice.id,
                                            servicename:
                                                editservice.servicename,
                                            imgurl: imgurl,
                                            description:
                                                editservice.description,
                                            price: editservice.price,
                                          );
                                          setState(() {});
                                        },
                                        onpressGallery: () async {
                                          imgurl = await imagepicked
                                              .imagetakenGallery(phoneNo);
                                          Navigator.of(context).pop();
                                          editservice = ServiceModel(
                                            id: editservice.id,
                                            servicename:
                                                editservice.servicename,
                                            imgurl: imgurl,
                                            description:
                                                editservice.description,
                                            price: editservice.price,
                                          );
                                          setState(() {
                                            print('image taken');
                                            print('${editservice.imgurl}');
                                            print('image taken');
                                            print('image taken');
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset(
                                    'assets/images/Vector (11).png'),
                              ),
                              Text('Upload Image')
                            ],
                          ),
                  ),
                  SizedBox(height: 5),
                  Form(
                    key: _Form,
                    child: Column(
                      children: [
                        reusablebox(
                          height: 0.1,
                          child: ReusableTextField(
                            hinttext: editservice.servicename == null
                                ? 'Service Name'
                                : initvalue['Servicename'],
                            //controller: servicename,
                            //    initialvalue: initvalue['Servicename'],
                            onsave: (value) {
                              print('i love you yr');
                              print('fuck you y');
                              print('fuck you o');
                              print('fuck you p');

                              editservice = ServiceModel(
                                id: editservice.id,
                                servicename: value,
                                description: editservice.description,
                                price: editservice.price,
                                imgurl: editservice.imgurl,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        reusablebox(
                          height: 0.25,
                          child: ReusableTextField(
                            hinttext: editservice.description == null
                                ? 'Description'
                                : initvalue['Description'],
                            //controller: description,
                            //   initialvalue: initvalue['Description'],
                            onsave: (value) {
                              editservice = ServiceModel(
                                  id: editservice.id,
                                  servicename: editservice.servicename,
                                  description: value,
                                  price: editservice.price,
                                  imgurl: editservice.imgurl);
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        reusablebox(
                          height: 0.1,
                          child: ReusableTextField(
                            hinttext: editservice.price == null
                                ? 'Price'
                                : initvalue['Price'],
                            //   controller: price,
                            //   initialvalue: initvalue['Price'],
                            onsave: (value) {
                              editservice = ServiceModel(
                                  id: editservice.id,
                                  servicename: editservice.servicename,
                                  description: editservice.description,
                                  price: value,
                                  imgurl: editservice.imgurl);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          roundedbutton(
            buttontext: 'Create Service',
            onpress: () async {
              _Form.currentState?.save();
              print('what you yr');
              print('fuck you y');
              print('fuck you o');
              print('fuck you p');
              editservice = ServiceModel(
                id: editservice.id,
                servicename: editservice.servicename,
                imgurl: editservice.imgurl,
                description: editservice.description,
                price: editservice.price,
              );
              print('hate you yr');
              print('fuck you y');
              print('fuck you o');
              print('fuck you p');
              if (_isinit == true) {
                print('love you yr');
                print('fuck you y');
                print('fuck you o');
                print('fuck you p');
                await Provider.of<services>(context, listen: false)
                    .updateServise(editservice.id, editservice);
              } else {
                await Provider.of<services>(context, listen: false)
                    .addService(editservice, phoneNo);
              }
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Services()));
            },
          ),
        ],
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  ///  TextEditingController controller = new TextEditingController();
  Function(String?)? onsave;
  String? hinttext;
  // String? initialvalue;
  ReusableTextField({
    required this.hinttext,
    // required this.controller,
    //  required this.initialvalue,
    required this.onsave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsave,
      //  initialValue: initialvalue,
      // controller: controller,
      decoration: InputDecoration(
        hintText: '$hinttext',
        contentPadding: EdgeInsets.all(15),
        border: InputBorder.none,
      ),
    );
  }
}
