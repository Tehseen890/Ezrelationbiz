import 'package:business_management/BusinessDetailPages/Messages.dart';
import 'package:business_management/HomePages/Clientprofile.dart';

import 'package:business_management/HomePages/Home/Home.dart';
import 'package:business_management/HomePages/Notification.dart';
import 'package:business_management/Models/BusinessModel.dart';
import 'package:business_management/Profile/profile.dart';
import 'package:business_management/SchedulePages/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottom extends StatefulWidget {
  int currentindex;
  bottom({required this.currentindex, Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  //int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xFFD8DEF1)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      // height: 70,
      width: 394,
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1FA0D0),
        onTap: (value) => setState(() {
          widget.currentindex = value;
          if (value == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Schedule()));
          } else if (value == 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          } else if (value == 2) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Messages()));
          } else if (value == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Notifications()));
          } else if (value == 4) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Profile()),
            );
            // currentindex = 0;
          }
        }),
        currentIndex: widget.currentindex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              //height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.currentindex == 0
                        ? Color(0xFF1FA0D0)
                        : Colors.white),
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ImageIcon(
                AssetImage('assets/images/Vectorr.png'),
                size: 22,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              //height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.currentindex == 1
                        ? Color(0xFF1FA0D0)
                        : Colors.white),
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ImageIcon(
                AssetImage('assets/images/Vector (4).png'),
                size: 22,
              ),
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                //height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.currentindex == 2
                          ? Color(0xFF1FA0D0)
                          : Colors.white),
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageIcon(
                  AssetImage('assets/images/chat.png'),
                  size: 22,
                )),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                //height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.currentindex == 3
                          ? Color(0xFF1FA0D0)
                          : Colors.white),
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageIcon(
                  AssetImage('assets/images/Vector (10).png'),
                  size: 22,
                )),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              //height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.currentindex == 4
                        ? Color(0xFF1FA0D0)
                        : Colors.white),
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CircleAvatar(
                radius: 12,
                backgroundImage:
                    AssetImage('assets/images/unsplash_iEEBWgY_6lA.png'),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
