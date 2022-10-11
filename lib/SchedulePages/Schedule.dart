import 'package:business_management/Models/Schedule.dart';
import 'package:business_management/SchedulePages/Add_Schedule.dart';
import 'package:business_management/Widgets/Drawer.dart';
import 'package:business_management/Widgets/ReusableBox.dart';
import 'package:business_management/Widgets/ScheduleTabBar.dart';
import 'package:business_management/Widgets/TabBar.dart';
import 'package:business_management/Widgets/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  int? color = 1;
  int index = 1;
  callback(value) {
    setState(() {
      color = value;
      print(value);
    });
  }

  Schedulecallback(value) {
    setState(() {
      index = value;
      print(value);
    });
  }

  // @override
  // void initState() {
  //   Provider.of<Schedules>(context, listen: false)
  //       .fetchoutgoingschedules(phoneNo);
  //   Provider.of<Schedules>(context, listen: false)
  //       .fetchincomingschedules(phoneNo);
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final outgoing = Provider.of<Schedules>(context).outgoingitems;
    //  final incoming = Provider.of<Schedules>(context).incomingitems;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Schedule',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ScheduleTabBar(
                      text1: 'Incoming Schedules',
                      text2: 'Outgoing Schedules',
                      callbackfunction: Schedulecallback),
                ),
              ],
            ),
            TapBar(
              text1: 'Businesses',
              text2: 'Client',
              callbackfunction: callback,
            ),
            index == 1
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Fri',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '22',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 5,
                                color: Color(0xFF1FA0D0),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF2F5FC),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Car Wash',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Service: Need Plumber'),
                                          SizedBox(height: 5),
                                          Text('9:30am to 10:30am'),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return SingleChildScrollView(
                                                  child: AlertDialogeBox(),
                                                );
                                              });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xFF1FA0D0),
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xFF1FA0D0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sun',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '22',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 5,
                                color: Color(0xFF1FA0D0),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF2F5FC),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Drawing',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Service:Need Painter'),
                                          SizedBox(height: 5),
                                          Text('11am to 12pm'),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF4D03F),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Pending',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Schedule()));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF1FA0D0),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: bottom(currentindex: 1),
    );
  }
}

class AlertDialogeBox extends StatelessWidget {
  const AlertDialogeBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 290,
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please tell us the reason',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                reusablebox(
                  height: 0.2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your reason here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF1FA0D0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF1FA0D0),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF1FA0D0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
