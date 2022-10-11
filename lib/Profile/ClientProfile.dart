// import 'package:business_management/Models/ClientModel.dart';
// import 'package:business_management/Profile/QR_code.dart';
// import 'package:business_management/Widgets/Drawer.dart';
// import 'package:business_management/Widgets/ImagepickerWidget.dart';

// import 'package:business_management/Widgets/bottom.dart';
// import 'package:business_management/Widgets/imageAlertDialoge.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Profile extends StatefulWidget {
//   // int currentindex = 0;
//   Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
//   ImagepickerWidget imagepicked = ImagepickerWidget();
//   String? imgurl;
//   @override
//   void initState() {
//     Provider.of<clients>(context, listen: false)
//         .fetchClient(FirebaseAuth.instance.currentUser?.phoneNumber);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loadeddata = Provider.of<clients>(context, listen: false).clientdata;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.black),
//           title: Text(
//             'Profile',
//             style: TextStyle(color: Color(0xFF1FA0D0)),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => QR_code()));
//               },
//               icon: Icon(Icons.qr_code),
//             ),
//           ],
//         ),
//         drawer: AppDrawer(),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               Container(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 100,
//                       backgroundImage:
//                           AssetImage('assets/images/unsplash_iEEBWgY_6lA.png'),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFF1FA0D0),
//                         ),
//                         child: IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return imageAlertDialoge(
//                                   onpressCamera: () async {
//                                     imgurl = await imagepicked
//                                         .imagetakenCamera(phoneNo);
//                                     Navigator.of(context).pop();
//                                     setState(() {});
//                                   },
//                                   onpressGallery: () async {
//                                     imgurl = await imagepicked
//                                         .imagetakenGallery(phoneNo);
//                                     Navigator.of(context).pop();
//                                     setState(() {});
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                           icon: ImageIcon(
//                               AssetImage('assets/images/camera.png'),
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.FullName}'),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.family}'),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.Address}'),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.City}'),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.ZipCode}'),
//               ),
//               profilebox(
//                 child: ProfileCard(text: '${loadeddata.Email}'),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: bottom(currentindex: 4));
//   }
// }

// class profilebox extends StatelessWidget {
//   Widget child;
//   profilebox({
//     required this.child,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFFD8DEF1)),
//           borderRadius: BorderRadius.circular(15)),
//       child: child,
//     );
//   }
// }

// class ProfileCard extends StatelessWidget {
//   String text;
//   ProfileCard({
//     required this.text,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('$text'),
//         Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFFF2F5FC),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.edit),
//           ),
//         ),
//       ],
//     );
//   }
// }
