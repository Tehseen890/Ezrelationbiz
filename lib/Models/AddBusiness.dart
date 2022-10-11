import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddBusinessModel {
  String? id,
      businessid,
      businessOwnerId,
      FullName,
      Email,
      Password,
      family,
      Address,
      City,
      ZipCode,
      BusinessName,
      BusinessWebsite,
      BusinessNumber;

  AddBusinessModel({
    this.id,
    this.businessid,
    this.businessOwnerId,
    this.FullName,
    this.Email,
    this.Password,
    this.family,
    this.Address,
    this.City,
    this.ZipCode,
    this.BusinessName,
    this.BusinessWebsite,
    this.BusinessNumber,
  });
}

class BusinessList with ChangeNotifier {
  List<AddBusinessModel> _items = [];

  List<AddBusinessModel> get items {
    return [..._items];
  }

  addBusinesses(String? businessid, AddBusinessModel businessdetail) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/ListOfBusinesses.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'BusinessId': businessid,
            'BusinessOwnerId': businessdetail.businessid,
            'Full name': businessdetail.FullName,
            'Family': businessdetail.family,
            'Business name': businessdetail.BusinessName,
            'Business number': businessdetail.BusinessNumber,
            'Address': businessdetail.Address,
            'City': businessdetail.City,
            'Zip Code': businessdetail.ZipCode,
            'Email': businessdetail.Email,
            'Website': businessdetail.BusinessWebsite,
          },
        ),
      );
    } catch (e) {
      print('How are you');
    }

    //  _items.add(businessdetail);
  }

  fetchbusinesses(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("BusinessId"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/ListOfBusinesses.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      List<AddBusinessModel> loadeddata = [];
      extracteddata.forEach((busnisid, businessData) {
        loadeddata.add(
          AddBusinessModel(
            id: busnisid,
            businessid: businessData['BusinessId'],
            businessOwnerId: businessData['BusinessOwnerId'],
            FullName: businessData['Full name'],
            Email: businessData['Email'],
            family: businessData['Family'],
            Address: businessData['Address'],
            City: businessData['City'],
            ZipCode: businessData['Zip Code'],
            BusinessName: businessData['Business name'],
            BusinessNumber: businessData['Business number'],
            BusinessWebsite: businessData['Website'],
          ),
        );
        _items = loadeddata;
        notifyListeners();
      });
    } catch (e) {
      print('There is a women');
    }

    // return businessdata;
  }

  AddBusinessModel loadedBusiness = AddBusinessModel();
  AddBusinessModel loadedbusiness(String? id) {
    loadedBusiness = _items.firstWhere((element) => element.id == id);
    return loadedBusiness;
  }
}
