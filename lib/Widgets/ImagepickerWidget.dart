import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget {
  String? imgurl;
  Future<String?> imagetakenCamera(String? phoneNo) async {
    final picker = ImagePicker();
    final imagefile = await picker.pickImage(
      source: ImageSource.camera,
      //  maxWidth: 600,
      preferredCameraDevice: CameraDevice.rear,
    );
    final pNo = FirebaseAuth.instance.currentUser?.phoneNumber;
    final ref = await FirebaseStorage.instance
        .ref()
        .child('$phoneNo')
        .child(DateTime.now().toString());
    // ignore: unused_local_variable
    final image = File(imagefile!.path);

    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    imgurl = url;
    return imgurl;
    // Navigator.of(context).pop();
    // setState(() {
    //   imgurl = url;
    // });
  }

  Future<String?> imagetakenGallery(String? phoneNo) async {
    final picker = ImagePicker();
    final imagefile = await picker.pickImage(
      source: ImageSource.gallery,
      // maxWidth: 600,
      preferredCameraDevice: CameraDevice.rear,
    );

    final pNo = FirebaseAuth.instance.currentUser?.phoneNumber;
    final ref = await FirebaseStorage.instance
        .ref()
        .child('$phoneNo')
        .child(DateTime.now().toString());
    // ignore: unused_local_variable
    final image = File(imagefile!.path);

    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    imgurl = url;
    return imgurl;
    // Navigator.of(context).pop();
    // setState(() {
    //   imgurl = url;
    // });
  }

  Future<String?> videotakenGallery() async {
    final picker = ImagePicker();
    final imagefile = await picker.pickVideo(source: ImageSource.gallery);
    final pNo = FirebaseAuth.instance.currentUser?.phoneNumber;
    final ref = await FirebaseStorage.instance
        .ref()
        .child('Posts')
        .child(DateTime.now().toString());
    // ignore: unused_local_variable
    final image = File(imagefile!.path);

    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    //  Navigator.of(context).pop();

    imgurl = url;
    return imgurl;
    // controller = VideoPlayerController.network('${imgurl}')
    //   ..initialize().then((value) {
    //     setState(() {});
    //   });
  }

  Future<String?> ProfileimagetakenCamera(String? phoneNo) async {
    final picker = ImagePicker();
    final imagefile = await picker.pickImage(
      source: ImageSource.camera,
      //  maxWidth: 600,
      preferredCameraDevice: CameraDevice.rear,
    );
    final pNo = FirebaseAuth.instance.currentUser?.phoneNumber;
    final ref = await FirebaseStorage.instance
        .ref()
        .child('ProfileImages')
        .child(phoneNo.toString() + '.jpg');
    // ignore: unused_local_variable
    final image = File(imagefile!.path);

    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    imgurl = url;
    return imgurl;
    // Navigator.of(context).pop();
    // setState(() {
    //   imgurl = url;
    // });
  }

  Future<String?> ProfileimagetakenGallery(String? phoneNo) async {
    final picker = ImagePicker();
    final imagefile = await picker.pickImage(
      source: ImageSource.gallery,
      // maxWidth: 600,
      preferredCameraDevice: CameraDevice.rear,
    );
    final pNo = FirebaseAuth.instance.currentUser?.phoneNumber;
    final ref = await FirebaseStorage.instance
        .ref()
        .child('ProfileImages')
        .child(phoneNo.toString() + '.jpg');
    // ignore: unused_local_variable
    final image = File(imagefile!.path);

    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    imgurl = url;
    return imgurl;
    // Navigator.of(context).pop();
    // setState(() {
    //   imgurl = url;
    // });
  }
}
