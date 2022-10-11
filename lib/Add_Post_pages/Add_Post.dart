import 'package:business_management/Add_Post_pages/Posts.dart';
import 'package:business_management/Models/PostModel.dart';
import 'package:business_management/Widgets/ImagepickerWidget.dart';
import 'package:business_management/Widgets/ReusableBox.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:business_management/Widgets/imageAlertDialoge.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Add_Post extends StatefulWidget {
  static const routename = '/Add_Post';
  Add_Post({Key? key}) : super(key: key);

  @override
  State<Add_Post> createState() => _Add_PostState();
}

class _Add_PostState extends State<Add_Post> {
  var initvalue = {
    'imgurl': '',
    'videourl': '',
    'Description': '',
  };
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  ImagepickerWidget imagepicked = ImagepickerWidget();
  VideoPlayerController? controller;
  String? imgurl = null;
  String? videoUrl = null;
  postModel loadedData = postModel();

  var editpost = postModel();
  var _isinit = true;
  @override
  void didChangeDependencies() async {
    if (ModalRoute.of(context)!.settings.arguments.runtimeType == bool) {
      _isinit = false;
    } else {
      _isinit = true;
    }
    if (_isinit) {
      final postid = ModalRoute.of(context)?.settings.arguments as String?;
      editpost = await Provider.of<posts>(context)
          .items
          .firstWhere((element) => element.id == postid);

      initvalue = {
        'imgurl': editpost.imgurl.toString(),
        'videourl': editpost.videourl.toString(),
        'Description': editpost.derscription.toString(),
      };
      if (editpost.videourl != null) {
        videoUrl = editpost.videourl;
        controller = VideoPlayerController.network('${videoUrl}')
          ..initialize().then((value) {
            setState(() {});
          });
      } else {
        imgurl = editpost.imgurl;
        controller = VideoPlayerController.network('${imgurl}')
          ..initialize().then((value) {
            setState(() {});
          });
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptioncontroller = TextEditingController();
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
          'Add Post',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  reusablebox(
                    height: 0.3,
                    child: videoUrl != null
                        ? Stack(
                            children: [
                              //  vidplayer(),
                              VideoPlayer(controller!),
                              Positioned(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        print(controller?.value);
                                        controller!.value.isPlaying
                                            ? controller?.pause()
                                            : controller?.play();
                                      });
                                    },
                                    icon: Icon(Icons.play_circle)),
                              )
                            ],
                          )
                        : imgurl == null && videoUrl == null
                            ? Column(
                                children: [
                                  SizedBox(height: 50),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFF2F5FC),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return imageAlertDialoge(
                                                onpressCamera: () async {
                                                  videoUrl = await imagepicked
                                                      .videotakenGallery();
                                                  editpost = postModel(
                                                    videourl: videoUrl,
                                                    imgurl: editpost.imgurl,
                                                    derscription:
                                                        editpost.derscription,
                                                  );
                                                  Navigator.of(context).pop();
                                                  controller =
                                                      VideoPlayerController
                                                          .network(
                                                              '${videoUrl}')
                                                        ..initialize()
                                                            .then((value) {
                                                          setState(() {});
                                                        });
                                                },
                                                onpressGallery: () async {
                                                  imgurl = await imagepicked
                                                      .imagetakenGallery(
                                                          'Posts');
                                                  editpost = postModel(
                                                    videourl: editpost.videourl,
                                                    imgurl: imgurl,
                                                    derscription:
                                                        editpost.derscription,
                                                  );
                                                  Navigator.of(context).pop();
                                                  setState(() {});
                                                  // controller = VideoPlayerController
                                                  //     .network('${imgurl}')
                                                  //   ..initialize().then((value) {
                                                  //     setState(() {});
                                                  //   });
                                                },
                                              );
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
                              )
                            : Image.network('$imgurl'),
                  ),
                  reusablebox(
                    height: 0.2,
                    child: TextField(
                      controller: descriptioncontroller,
                      decoration: InputDecoration(
                        hintText: editpost.derscription != null
                            ? initvalue['Description']
                            : 'Description',
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          roundedbutton(
              buttontext: 'Save',
              onpress: () async {
                editpost = postModel(
                  id: editpost.id,
                  videourl: editpost.videourl,
                  imgurl: editpost.imgurl,
                  derscription: descriptioncontroller.text,
                );
                if (_isinit == true) {
                  await Provider.of<posts>(context, listen: false)
                      .updatePost(editpost.id, editpost);
                } else {
                  await Provider.of<posts>(context, listen: false)
                      .addPosts(editpost);
                }
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Posts()));
              }),
        ],
      ),
    );
  }
}
