import 'dart:convert';

import 'package:business_management/Models/AddBusiness.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserModel {
  String? id,
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
  UserModel({
    this.id,
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

class Accounttype {
  String? id, AccountType;
  Accounttype({this.id, this.AccountType});
}

class ProfileImage {
  String? id, imgurl;
  ProfileImage({this.id, this.imgurl});
}

class Users with ChangeNotifier {
  Accounttype accounttype = Accounttype();
  ProfileImage profileImage = ProfileImage();
  addaccounttype(String? id, String? accountT) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/AccountType.json');

    try {
      await http.post(url,
          body: json.encode({'PhoneNo': id, 'Account Type': accountT}));
    } catch (e) {}
  }

  fetchaccounttype(String? id) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("PhoneNo"),
      'equalTo': json.encode(id),
    };
    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/AccountType.json', _params);

    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      extracteddata.forEach((key, value) {
        accounttype =
            Accounttype(id: value['id'], AccountType: value['Account Type']);
      });
    } catch (e) {}
    return accounttype.AccountType;
  }

  UserModel Userdata = UserModel();
  AddBusinessModel FetchBusinesForUser = AddBusinessModel();

  addBusinessDetail(UserModel businessdetail) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/business.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': businessdetail.id,
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

  fetchbusines(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("id"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/business.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      extracteddata.forEach((key, businessData) {
        Userdata = UserModel(
          id: businessData['id'],
          FullName: businessData['Full name'],
          Email: businessData['Email'],
          family: businessData['Family'],
          Address: businessData['Address'],
          City: businessData['City'],
          ZipCode: businessData['Zip Code'],
          BusinessName: businessData['Business name'],
          BusinessNumber: businessData['Business number'],
          BusinessWebsite: businessData['Website'],
        );
      });
    } catch (e) {
      print('There is a women');
    }

    // return businessdata;
  }

  fetchbusinesforuser(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("id"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/business.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      extracteddata.forEach((key, businessData) {
        FetchBusinesForUser = AddBusinessModel(
          businessid: businessData['id'],
          FullName: businessData['Full name'],
          Email: businessData['Email'],
          family: businessData['Family'],
          Address: businessData['Address'],
          City: businessData['City'],
          ZipCode: businessData['Zip Code'],
          BusinessName: businessData['Business name'],
          BusinessNumber: businessData['Business number'],
          BusinessWebsite: businessData['Website'],
        );
      });
    } catch (e) {
      print('There is a women');
    }

    return FetchBusinesForUser;
  }

  addClientDetail(UserModel businessdetail) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/business.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': businessdetail.id,
            'Full name': businessdetail.FullName,
            'Family': businessdetail.family,
            'Address': businessdetail.Address,
            'City': businessdetail.City,
            'Zip Code': businessdetail.ZipCode,
            'Email': businessdetail.Email,
          },
        ),
      );
    } catch (e) {
      print('How are you');
    }

    //  _items.add(businessdetail);
  }

  fetchClients(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("id"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/business.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      extracteddata.forEach((key, businessData) {
        Userdata = UserModel(
          id: businessData['id'],
          FullName: businessData['Full name'],
          Email: businessData['Email'],
          family: businessData['Family'],
          Address: businessData['Address'],
          City: businessData['City'],
          ZipCode: businessData['Zip Code'],
        );
      });
    } catch (e) {
      print('There is a women');
    }

    return Userdata;
  }

  addProfileImage(String? id, String? imgurl) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/ProfileImages.json');

    try {
      await http.post(url,
          body: json.encode({'PhoneNo': id, 'Imageurl': imgurl}));
    } catch (e) {}
  }

  fetchProfileImage(String? id) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("PhoneNo"),
      'equalTo': json.encode(id),
    };
    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/ProfileImages.json', _params);

    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      extracteddata.forEach((key, value) {
        profileImage =
            ProfileImage(id: value['PhoneNo'], imgurl: value['Imageurl']);
      });
    } catch (e) {}
    return profileImage.imgurl;
  }
}
