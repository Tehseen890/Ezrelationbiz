import 'package:business_management/Add_Post_pages/Posts.dart';
import 'package:business_management/Models/GalleryModel.dart';
import 'package:business_management/Models/PostModel.dart';
import 'package:business_management/Widgets/ImagepickerWidget.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_Pic extends StatefulWidget {
  static const routename = '/Add_Pic';
  Add_Pic({Key? key}) : super(key: key);

  @override
  State<Add_Pic> createState() => _Add_PicState();
}

class _Add_PicState extends State<Add_Pic> {
  GalleryModel data = GalleryModel();
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  String? imgUrl = null;
  ImagepickerWidget imagepicked = ImagepickerWidget();
  List<String?> galleryImgUrl = [];
  @override
  Widget build(BuildContext context) {
    Provider.of<Galleryimages>(context).fetchGallery(phoneNo);
    final extracteddata = Provider.of<Galleryimages>(context).items;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color(0xFFF2F5FC),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/Vector (2).png'),
          ),
        ),
        title: Text(
          'Add Picture',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  //  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.withOpacity(0.23),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF2F5FC),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            imgUrl =
                                await imagepicked.imagetakenGallery(phoneNo);
                            data = GalleryModel(
                                id: phoneNo, galleryimgUrl: imgUrl);
                            await Provider.of<Galleryimages>(context,
                                    listen: false)
                                .addGallery(data);
                            await Provider.of<Galleryimages>(context,
                                    listen: false)
                                .fetchGallery(phoneNo);

                            setState(() {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Posts()));
                            });
                          },
                          icon: Icon(
                            Icons.add_a_photo_sharp,
                            color: Color(0xFF1FA0D0),
                          ),
                        ),
                      ),
                      Text('Add Pic')
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.builder(
                    shrinkWrap: true,
                    //    physics: NeverScrollableScrollPhysics(),
                    itemCount: extracteddata.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, i) => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          //  padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.withOpacity(0.23),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.network(
                            '${extracteddata[i].galleryimgUrl}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 35,
                          child: Container(
                            //  padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF2F5FC),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          roundedbutton(buttontext: 'Save', onpress: () {})
        ],
      ),
    );
  }
}
