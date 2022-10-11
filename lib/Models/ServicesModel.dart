import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ServiceModel {
  String? id, servicename, imgurl, description, price;

  ServiceModel({
    this.id,
    this.imgurl,
    this.servicename,
    this.description,
    this.price,
  });
}

class services with ChangeNotifier {
  List<ServiceModel> _items = [];

  List<ServiceModel> get items {
    return [..._items];
  }

  addService(ServiceModel servicedata, String? phoneNO) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/Services.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'Creatorid': phoneNO,
            'Service name': servicedata.servicename,
            'imageurl': servicedata.imgurl,
            'Description': servicedata.description,
            'Price': servicedata.price,
          },
        ),
      );
      print('${json.decode(response.body)['name']}');
      print('tttt you yr');
      print('fuck you y');
      print('fuck you o');
      print('fuck you p');
      final editservice = ServiceModel(
        id: json.decode(response.body)['name'],
        servicename: servicedata.servicename,
        imgurl: servicedata.imgurl,
        description: servicedata.description,
        price: servicedata.price,
      );
      _items.add(editservice);
    } catch (e) {}
  }

  fetchServices(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("Creatorid"),
      'equalTo': json.encode(usernumber),
    };
    var url = Uri.https(
        'ezrelationbiz-default-rtdb.firebaseio.com', '/Services.json', _params);

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedata = json.decode(response.body) as Map<String, dynamic>;
      List<ServiceModel> loadedData = [];
      extractedata.forEach(
        (serviceid, ServicesData) {
          loadedData.add(
            ServiceModel(
              id: serviceid,
              servicename: ServicesData['Service name'],
              imgurl: ServicesData['imageurl'],
              description: ServicesData['Description'],
              price: ServicesData['Price'],
            ),
          );
        },
      );
      _items = loadedData;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> updateServise(String? id, ServiceModel newService) async {
    final serviceindex = _items.indexWhere((service) => service.id == id);
    print('kite you yr');
    print('fuck you y');
    print('fuck you o');
    print('fuck you p');
    print(newService.servicename);
    print(newService.id);
    print(serviceindex);
    print(id);
    if (serviceindex >= 0) {
      print('fly you yr');
      print('${newService.imgurl}');
      print('fuck you y');
      print('fuck you o');
      print('fuck you p');
      final url = Uri.parse(
          'https://ezrelationbiz-default-rtdb.firebaseio.com/Services/$id.json');
      print('lose you yr');
      print('fuck you y');
      print('fuck you o');
      print('fuck you p');
      await http.patch(url,
          body: json.encode({
            'Service name': newService.servicename,
            'Description': newService.description,
            'Price': newService.price,
            'imageurl': newService.imgurl,
          }));
      print('ver you yr');
      print('fuck you y');
      print('fuck you o');
      print('fuck you p');
      print(newService.servicename);
      print(newService.id);
      _items[serviceindex] = newService;
      notifyListeners();
    } else {
      print('lll you yr');
      print('fuck you y');
      print('fuck you o');
      print('fuck you p');
    }
  }
}
