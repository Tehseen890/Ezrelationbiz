import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ScheduleModel {
  String? outgoingid, incomingid, date, time, choseservice, name;

  ScheduleModel({
    this.outgoingid,
    this.incomingid,
    this.date,
    this.time,
    this.choseservice,
    this.name,
  });
}

class Schedules with ChangeNotifier {
  List<ScheduleModel> outgoingitems = [];
  List<ScheduleModel> incomingitems = [];

  OutgoingSchedule(ScheduleModel schedule) async {
    final url = Uri.parse(
        'https://ezrelationbiz-default-rtdb.firebaseio.com/Schedules.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'Outgoing': schedule.outgoingid,
            'Incoming': schedule.incomingid,
            'Date': schedule.date,
            'Time': schedule.time,
            'Chossedservice': schedule.choseservice,
            'Titlename': schedule.name,
          },
        ),
      );
    } catch (e) {
      print('How are you');
    }

    //  _items.add(businessdetail);
  }

  fetchoutgoingschedules(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("Outgoing"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/Schedules.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      List<ScheduleModel> loadeddata = [];
      extracteddata.forEach((busnisid, scheduleData) {
        loadeddata.add(
          ScheduleModel(
            outgoingid: scheduleData['Outgoing'],
            incomingid: scheduleData['Incoming'],
            date: scheduleData['Date'],
            time: scheduleData['Time'],
            choseservice: scheduleData['Chossedservice'],
            name: scheduleData['Titlename'],
          ),
        );
        outgoingitems = loadeddata;
        notifyListeners();
      });
    } catch (e) {
      print('There is a women');
    }

    // return businessdata;
  }

  fetchincomingschedules(String? usernumber) async {
    var _params;
    _params = <String, String>{
      'orderBy': json.encode("Incoming"),
      'equalTo': json.encode(usernumber),
    };

    var url = Uri.https('ezrelationbiz-default-rtdb.firebaseio.com',
        '/Schedules.json', _params);
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extracteddata = json.decode(response.body) as Map<String, dynamic>;
      List<ScheduleModel> loadeddata = [];
      extracteddata.forEach((busnisid, scheduleData) {
        loadeddata.add(
          ScheduleModel(
            outgoingid: scheduleData['Outgoing'],
            incomingid: scheduleData['Incoming'],
            date: scheduleData['Date'],
            time: scheduleData['Time'],
            choseservice: scheduleData['Chossedservice'],
            name: scheduleData['Titlename'],
          ),
        );
        incomingitems = loadeddata;
        notifyListeners();
      });
    } catch (e) {
      print('There is a women');
    }

    // return businessdata;
  }
}
