import 'package:business_management/Models/BusinessModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapBar extends StatefulWidget {
  String text1, text2;
  Function callbackfunction;
  TapBar({
    required this.text1,
    required this.text2,
    required this.callbackfunction,
  });
  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  int color = 1;
  @override
  Widget build(BuildContext context) {
    final acctType =
        Provider.of<Users>(context, listen: false).accounttype.AccountType;
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
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
          child: acctType == 'Business'
              ? Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
