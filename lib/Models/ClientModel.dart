// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

// class clientModel {
//   String? id, FullName, Email, Password, family, Address, City, ZipCode;

//   clientModel({
//     this.id,
//     this.FullName,
//     this.Email,
//     this.Password,
//     this.family,
//     this.Address,
//     this.City,
//     this.ZipCode,
//   });
// }

// class clients with ChangeNotifier {
//   //String? phoneNumber;
//   late clientModel clientdata;
//   // business([this.phoneNumber]);
//   List<clientModel> _items = [];
//   get items {
//     return [..._items];
//   }

//   addClientdetail(clientModel clientdetail) async {
//     final url = Uri.parse(
//         'https://ezrelationbiz-default-rtdb.firebaseio.com/clients.json');

//     try {
//       final response = await http.post(
//         url,
//         body: json.encode(
//           {
//             'id': clientdetail.id,
//             'Full name': clientdetail.FullName,
//             'Family': clientdetail.family,
//             'Address': clientdetail.Address,
//             'City': clientdetail.City,
//             'Zip Code': clientdetail.ZipCode,
//             'Email': clientdetail.Email,
//           },
//         ),
//       );
//     } catch (e) {
//       print('How are you');
//     }

//     _items.add(clientdetail);
//   }

//   fetchClient(String? usernumber) async {
//     var _params;
//     _params = <String, String>{
//       'orderBy': json.encode("id"),
//       'equalTo': json.encode(usernumber),
//     };

//     var url = Uri.https(
//         'ezrelationbiz-default-rtdb.firebaseio.com', '/clients.json', _params);
//     try {
//       final response = await http.get(url);
//       print(json.decode(response.body));

//       final extracteddata = json.decode(response.body) as Map<String, dynamic>;
//       extracteddata.forEach((key, clientData) {
//         clientdata = clientModel(
//           id: clientData['id'],
//           FullName: clientData['Full name'],
//           Email: clientData['Email'],
//           family: clientData['Family'],
//           Address: clientData['Address'],
//           City: clientData['City'],
//           ZipCode: clientData['Zip Code'],
//         );
//       });
//     } catch (e) {
//       print('There is a women');
//     }

//     return _items.where((element) => element.id == usernumber);
//   }
// }
