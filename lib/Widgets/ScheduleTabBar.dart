import 'package:flutter/material.dart';

class ScheduleTabBar extends StatefulWidget {
  String text1, text2;
  Function callbackfunction;
  ScheduleTabBar({
    required this.text1,
    required this.text2,
    required this.callbackfunction,
  });
  @override
  State<ScheduleTabBar> createState() => _ScheduleTabBarState();
}

class _ScheduleTabBarState extends State<ScheduleTabBar> {
  int color = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            color = 1;
            widget.callbackfunction(color);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            //  height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: color == 1 ? Color(0xFF1FA0D0) : Colors.white),
              color: Color(0xFFF2F5FC),
              borderRadius: BorderRadius.circular(10),
            ),
            //   padding: EdgeInsets.all(20),
            child: Text(
              '${widget.text1}',
              style: TextStyle(
                  color: color == 1 ? Color(0xFF1FA0D0) : Colors.black,
                  fontSize: 15),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            color = 2;
            widget.callbackfunction(color);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: color == 2 ? Color(0xFF1FA0D0) : Colors.white),
              color: Color(0xFFF2F5FC),
              borderRadius: BorderRadius.circular(10),
            ),
            //   padding: EdgeInsets.all(20),
            child: Text(
              '${widget.text2}',
              style: TextStyle(
                  color: color == 2 ? Color(0xFF1FA0D0) : Colors.black,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
