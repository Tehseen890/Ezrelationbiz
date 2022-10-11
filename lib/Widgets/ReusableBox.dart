import 'package:flutter/material.dart';

class reusablebox extends StatelessWidget {
  double height;
  Widget child;
  reusablebox({
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      // alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.18),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
