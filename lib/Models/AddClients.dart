import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddClients {
  String? clientid, FullName, Email, Password, family, Address, City, ZipCode;

  AddClients({
    this.clientid,
    this.FullName,
    this.Email,
    this.Password,
    this.family,
    this.Address,
    this.City,
    this.ZipCode,
  });
}

class ClientsList with ChangeNotifier {
  List<AddClients> _items = [];

  List<AddClients> get items {
    return [..._items];
  }

  addClients(String? clientid, AddClients clientdetail) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/ListOfClients.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': clientid,
            'Full name': clientdetail.FullName,
            'Family': clientdetail.family,
            'Address': clientdetail.Address,
            'City': clientdetail.City,
            'Zip Code': clientdetail.ZipCode,
            'Email': clientdetail.Email,
          },
        ),
      );
    } catch (e) {
      print('How are you');
    }

    //  _items.add(businessdetail);
  }

  fetchclients(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("id"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/ListOfClients.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      List<AddClients> loadeddata = [];
      extracteddata.forEach((key, businessData) {
        loadeddata.add(
          AddClients(
            clientid: businessData['id'],
            FullName: businessData['Full name'],
            Email: businessData['Email'],
            family: businessData['Family'],
            Address: businessData['Address'],
            City: businessData['City'],
            ZipCode: businessData['Zip Code'],
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
}
