import 'package:business_management/Add_Post_pages/Add_Post.dart';
import 'package:business_management/Models/AddBusiness.dart';

import 'package:business_management/Models/GalleryModel.dart';
import 'package:business_management/Models/PostModel.dart';
import 'package:business_management/Widgets/ReusableBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Posts extends StatefulWidget {
  Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  AddBusinessModel business = AddBusinessModel();
  final String? phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  VideoPlayerController? controller;
  @override
  void initState() {
    business = Provider.of<BusinessList>(context, listen: false).loadedBusiness;
    Provider.of<posts>(context, listen: false)
        .fetchPosts(business.businessOwnerId);
    Provider.of<Galleryimages>(context, listen: false)
        .fetchGallery(business.businessOwnerId);
    super.initState();
  }

  callback(value) {
    controller = value;
  }

  @override
  Widget build(BuildContext context) {
    final loadedData = Provider.of<posts>(context).items;
    final loadedGallery =
        Provider.of<Galleryimages>(context, listen: false).items;
    print('$loadedGallery');
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
          'Posts',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  business.businessid == business.businessOwnerId
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF1FA0D0)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Add_Post.routename,
                                  arguments: false);
                            },
                            child: Text(
                              'Add Post',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : Text(''),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: loadedData.length,
                itemBuilder: (context, index) => reusablebox(
                  height: 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      loadedData[index].imgurl != null
                          ? Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Image.network(
                                '${loadedData[index].imgurl}',
                                fit: BoxFit.fill,
                              ),
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: double.infinity,
                                  child: vidplayer(
                                    imgurl: loadedData[index].videourl,
                                    callback: callback,
                                  ),
                                ),
                                Positioned(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() async {
                                        print(controller?.value);
                                        await controller!.value.isPlaying
                                            ? await controller?.pause()
                                            : await controller?.play();
                                      });
                                    },
                                    icon: ImageIcon(
                                      AssetImage('assets/images/play (1).png'),
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                business.businessid == business.businessOwnerId
                                    ? Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          //  padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFF2F5FC),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  Add_Post.routename,
                                                  arguments:
                                                      loadedData[index].id);
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                      Text(
                        '${loadedData[index].derscription}',
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gallery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF1FA0D0)),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: loadedGallery.length,
                  itemBuilder: (context, index) =>
                      Image.network('${loadedGallery[index].galleryimgUrl}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class vidplayer extends StatefulWidget {
  String? imgurl;
  Function callback;
  vidplayer({
    required this.imgurl,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<vidplayer> createState() => _vidplayerState();
}

class _vidplayerState extends State<vidplayer> {
  VideoPlayerController? controller;
  @override
  void initState() {
    controller = VideoPlayerController.network('${widget.imgurl}')
      ..initialize().then((value) {
        setState(() {
          print(widget.imgurl);
          widget.callback(controller);
        });
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      controller!,
    );
  }
}
