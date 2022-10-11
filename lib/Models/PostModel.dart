import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class postModel {
  String? id, imgurl, videourl, derscription;

  postModel({
    this.id,
    this.imgurl,
    this.videourl,
    this.derscription,
  });
}

class posts with ChangeNotifier {
  List<postModel> _items = [];

  List<postModel> get items {
    return [..._items];
  }

  addPosts(postModel postsData) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/Posts.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'CreatorId': postsData.id,
            'imgurl': postsData.imgurl,
            'videourl': postsData.videourl,
            'Description': postsData.derscription,
          },
        ),
      );
      final editpost = postModel(
        id: json.decode(response.body)['name'],
        imgurl: postsData.imgurl,
        videourl: postsData.videourl,
        derscription: postsData.derscription,
      );
      _items.add(editpost);
    } catch (e) {}
  }

  fetchPosts(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("CreatorId"),
      'equalTo': json.encode(usernumber),
    };
    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/Posts.json', _params);

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedata = json.decode(response.body) as Map<String, dynamic>;
      List<postModel> loadedData = [];
      extractedata.forEach(
        (postsid, postsData) {
          loadedData.add(
            postModel(
              id: postsid,
              imgurl: postsData['imgurl'],
              videourl: postsData['videourl'],
              derscription: postsData['Description'],
            ),
          );
        },
      );
      _items = loadedData;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> updatePost(String? id, postModel newPost) async {
    final postindex = _items.indexWhere((posts) => posts.id == id);

    if (postindex >= 0) {
      final url = Uri.parse(
          'https://ezrelationbiz-default-rtdb.firebaseio.com/Posts/$id.json');

      await http.patch(url,
          body: json.encode({
            'imgurl': newPost.imgurl,
            'videourl': newPost.videourl,
            'Description': newPost.derscription,
          }));

      _items[postindex] = newPost;
      notifyListeners();
    } else {}
  }
}
