import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GalleryModel {
  String? id;
  String? galleryimgUrl;
  GalleryModel({this.id, this.galleryimgUrl});
}

class Galleryimages with ChangeNotifier {
  List<GalleryModel> _items = [];
  //List<String?>? galleryimagesurl = [];
  List<GalleryModel> get items {
    return [..._items];
  }

  addGallery(GalleryModel galleryData) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/Gallery.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': galleryData.id,
            'GalleryUrls': galleryData.galleryimgUrl,
          },
        ),
      );
      // _items.add(postsData);
    } catch (e) {}
  }

  fetchGallery(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("id"),
      'equalTo': json.encode(usernumber),
    };
    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/Gallery.json', _params);

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedata = json.decode(response.body) as Map<String, dynamic>;
      List<GalleryModel> loadedData = [];
      extractedata.forEach(
        (imgid, gallerydata) {
          loadedData.add(
            GalleryModel(
              id: gallerydata['id'],
              galleryimgUrl: gallerydata['GalleryUrls'],
            ),
          );
        },
      );
      _items = loadedData;
      notifyListeners();
    } catch (e) {
      print('how are you man');
      print('how are you boy');
      print('how are you buddy');
      print('how are you fuck');
    }
  }
}
