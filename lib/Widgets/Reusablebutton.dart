import 'package:flutter/material.dart';

class roundedbutton extends StatelessWidget {
  String buttontext;
  Function()? onpress;
  roundedbutton({
    required this.buttontext,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF1FA0D0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onpress,
        child: Text(
          '$buttontext',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
