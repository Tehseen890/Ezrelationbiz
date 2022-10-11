import 'package:business_management/Add_Post_pages/Add_Post.dart';
import 'package:business_management/Add_Post_pages/Add_pic.dart';
import 'package:business_management/BusinessDetailPages/BusinessDetail.dart';
import 'package:business_management/BusinessDetailPages/createService.dart';
import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/AddClients.dart';
import 'package:business_management/Models/BusinessModel.dart';

import 'package:business_management/Models/GalleryModel.dart';
import 'package:business_management/Models/PostModel.dart';
import 'package:business_management/Models/Schedule.dart';
import 'package:business_management/Models/ServicesModel.dart';
import 'package:business_management/Welcome/Welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => clients(),
        // ),
        ChangeNotifierProvider(
          create: (context) => services(),
        ),
        ChangeNotifierProvider(
          create: (context) => posts(),
        ),
        ChangeNotifierProvider(
          create: (context) => Galleryimages(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusinessList(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClientsList(),
        ),
        ChangeNotifierProvider(
          create: (context) => Schedules(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          CreateServices.routemane: (context) => CreateServices(),
          Add_Pic.routename: (context) => Add_Pic(),
          Add_Post.routename: (context) => Add_Post(),
          BusinessDetail.routename: (context) => BusinessDetail(),
        },
      ),
    );
  }
}
