// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class vidplayer extends StatefulWidget {
//   String? imgurl;
//   VideoPlayerController? videoplayercontroller;
//   vidplayer({
//     required this.imgurl,
//     required this.videoplayercontroller,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<vidplayer> createState() => _vidplayerState();
// }

// class _vidplayerState extends State<vidplayer> {
//   // VideoPlayerController? controller;
//   @override
//   void initState() {
//     widget.videoplayercontroller =
//         VideoPlayerController.network('${widget.imgurl}')
//           ..initialize().then((value) {
//             setState(() {
//               print(widget.videoplayercontroller?.value);
//             });
//           });
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VideoPlayer(
//       widget.videoplayercontroller!,
//     );
//   }
// }
