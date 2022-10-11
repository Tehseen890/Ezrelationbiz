import 'package:business_management/BusinessDetailPages/createService.dart';
import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/ServicesModel.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  AddBusinessModel business = AddBusinessModel();
  @override
  void initState() {
    business = Provider.of<BusinessList>(context, listen: false).loadedBusiness;
    Provider.of<services>(context, listen: false)
        .fetchServices(business.businessOwnerId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadedservice = Provider.of<services>(context).items;
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
          'Services',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: loadedservice.length,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                      //   height: MediaQuery.of(context).size.height * 0.5,
                      //   width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              '${loadedservice[i].imgurl}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            //   height: 50,
                            child: ListTile(
                              title: Text(
                                '${loadedservice[i].servicename}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    '${loadedservice[i].description}',
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${loadedservice[i].price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          business.businessid == business.businessOwnerId
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        CreateServices.routemane,
                                        arguments: loadedservice[i].id);
                                  },
                                  child: CircleAvatar(
                                    child:
                                        Image.asset('assets/images/pencil.png'),
                                    backgroundColor: Color(0xFFF2F5FC),
                                  ),
                                )
                              : Text(''),
                        ],
                      ));
                },
              ),
            ),
            business.businessid == business.businessOwnerId
                ? roundedbutton(
                    buttontext: 'Add Services',
                    onpress: () {
                      Navigator.of(context).pushNamed(CreateServices.routemane,
                          arguments: false);
                    })
                : Text(''),
          ],
        ),
      ),
    );
  }
}
