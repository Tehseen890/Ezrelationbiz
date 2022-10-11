import 'package:business_management/BusinessDetailPages/BusinessDetail.dart';
import 'package:business_management/HomePages/Home/Client.dart';
import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/BusinessModel.dart';

import 'package:business_management/Profile/Scan.dart';

import 'package:business_management/Widgets/Drawer.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:business_management/Widgets/Search.dart';
import 'package:business_management/Widgets/TabBar.dart';
import 'package:business_management/Widgets/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ActiveSeeAll = false;
  bool inActiveSeeAll = false;

  int? color = 1;

  callback(value) {
    setState(() {
      color = value;
      print(value);
    });
  }

  var phNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  int currentindex = 0;
  var showonlyfavourite = false;
  @override
  void initState() {
    Provider.of<BusinessList>(context, listen: false).fetchbusinesses(phNo);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Welcome',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            //  mainAxisSize: MainAxisSize.min,
            children: [
              TapBar(
                  text1: 'Businesses',
                  text2: 'Client',
                  callbackfunction: callback),
              color == 1 ? SearchAndButton(value: color) : Search(),
              color == 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Active',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ActiveSeeAll = !ActiveSeeAll;
                            });
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1FA0D0),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              color == 2 ? Clients(seeall: ActiveSeeAll) : BusinessDetailCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottom(currentindex: 0),
    );
  }

  ListView BusinessDetailCard() {
    final listofbusinesses = Provider.of<BusinessList>(context).items;
    // setState(() {});
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listofbusinesses.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Colors.grey.withOpacity(0.30)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              onTap: () {
                print('hello');
                print('hy');
                print('by');
                print(listofbusinesses[i].id);

                Navigator.of(context).pushNamed(BusinessDetail.routename,
                    arguments: listofbusinesses[i].id);
              },
              leading: CircleAvatar(child: Text('B')),
              title: Text('${listofbusinesses[i].BusinessName}'),
              subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur elit lectus adipiscing lectus augue penatibus eros mass.'),
            ),
          );
        });
  }

  Row SearchAndButton({int? value}) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Search(),
        ),
        SizedBox(width: 10),
        Expanded(
            flex: 2,
            child: roundedbutton(
                buttontext: 'Add Businesses',
                onpress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Scan()));
                }))
      ],
    );
  }
}
