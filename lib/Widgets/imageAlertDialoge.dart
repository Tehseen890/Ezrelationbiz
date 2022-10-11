import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class imageAlertDialoge extends StatelessWidget {
  Function()? onpressCamera;
  Function()? onpressGallery;
  imageAlertDialoge(
      {required this.onpressCamera, required this.onpressGallery, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AlertDialog(
        title: Text('Choose an Option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onpressCamera,
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/camera.png'),
                    color: Color(0xFF1FA0D0),
                  ),
                  SizedBox(width: 10),
                  Text('Camera'),
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: onpressGallery,
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/Vector (11).png'),
                    color: Color(0xFF1FA0D0),
                  ),
                  SizedBox(width: 10),
                  Text('Gallery'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
