import 'package:business_management/Models/AddBusiness.dart';
import 'package:business_management/Models/Schedule.dart';
import 'package:business_management/Models/ServicesModel.dart';
import 'package:business_management/Widgets/ReusableBox.dart';
import 'package:business_management/Widgets/Reusablebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_Schedule extends StatefulWidget {
  Add_Schedule({Key? key}) : super(key: key);

  @override
  State<Add_Schedule> createState() => _Add_ScheduleState();
}

class _Add_ScheduleState extends State<Add_Schedule> {
  final phoneNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  TextEditingController date = TextEditingController();
  TextEditingController service = TextEditingController();
  TextEditingController Timee = TextEditingController();
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  var items = [];
  String? selecteditem = 'Item 1';
  AddBusinessModel business = AddBusinessModel();
  @override
  void initState() {
    business = Provider.of<BusinessList>(context, listen: false).loadedBusiness;
    Provider.of<services>(context, listen: false)
        .fetchServices(business.businessOwnerId);
    Provider.of<services>(context, listen: false).items.forEach((element) {
      items.add(element.servicename);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          'Add Schedule',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            reusablebox(
              height: 0.1,
              child: TextField(
                controller: date,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'Pick Date',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  );
                  if (pickeddate != null) {
                    setState(() {
                      date.text = pickeddate.toString();
                    });
                  }
                },
              ),
            ),
            reusablebox(
              height: 0.1,
              child: TextField(
                controller: Timee,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'Pick Time',
                  border: InputBorder.none,
                  prefixIcon: Image.asset('assets/images/Vector (12).png'),
                ),
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,
                  );
                  if (newTime != null) {
                    setState(() {
                      Timee.text = time as String;
                    });
                  }
                },
              ),
            ),
            reusablebox(
              height: 0.1,
              child: TextField(
                controller: service,
                decoration: InputDecoration(
                    hintText: 'Choose Service',
                    border: InputBorder.none,
                    suffixIcon: Image.asset('assets/images/Vector (13).png')),
                onTap: () {
                  DropdownButton<String>(
                    items: items
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      service.text = val.toString();
                    },
                  );
                },
              ),
            ),
            reusablebox(
              height: 0.1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            reusablebox(
              height: 0.25,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                ),
              ),
            ),
            roundedbutton(
                buttontext: 'Add Schedule',
                onpress: () {
                  ScheduleModel data = ScheduleModel(
                    outgoingid: phoneNo,
                    incomingid: business.id,
                    date: date.text,
                    time: Timee.text,
                    choseservice: service.text,
                  );
                  Provider.of<Schedules>(context).OutgoingSchedule(data);
                })
          ],
        ),
      ),
    );
  }
}
