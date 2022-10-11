import 'package:business_management/Add_Post_pages/Add_Post_Pic_Copuns.dart';

import 'package:business_management/HomePages/Chat.dart';

import 'package:business_management/BusinessDetailPages/Call.dart';

import 'package:business_management/Add_Post_pages/Posts.dart';
import 'package:business_management/BusinessDetailPages/Services.dart';
import 'package:business_management/Models/AddBusiness.dart';

import 'package:business_management/SchedulePages/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessDetail extends StatefulWidget {
  static const routename = '/BusinessDetail';
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  AddBusinessModel loadedBusiness = AddBusinessModel();
  @override
  void didChangeDependencies() async {
    print('hello');
    print('hy');
    print('by');
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    print('by');
    print('hy');
    print(id);
    loadedBusiness =
        Provider.of<BusinessList>(context, listen: false).loadedbusiness(id);
    print('hy');
    print('by');
    print(loadedBusiness.id);

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

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
          'Business Name',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                //   height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          child: Icon(Icons.phone),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              '${loadedBusiness.BusinessName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              '${loadedBusiness.Address}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.50)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Information',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.phone,
                                  color: Color(0xFF707070),
                                ),
                                backgroundColor: Color(0xFFF2F5FC),
                              ),
                              SizedBox(width: 5),
                              Text('${loadedBusiness.BusinessNumber}'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(
                                    Icons.email,
                                    color: Color(0xFF707070),
                                  ),
                                  backgroundColor: Color(0xFFF2F5FC),
                                ),
                                SizedBox(width: 5),
                                Text('${loadedBusiness.Email}'),
                              ],
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: ListTile(
                        //     leading: Icon(Icons.email),
                        //     title: Text('03138902056'),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('About Company',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 5),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur elit lectus adipiscing lectus augue penatibus eros mass.'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconboxwithtext(
                          icon: 'assets/images/Vector (5).png',
                          text: 'Services',
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Services()));
                          },
                        ),
                        iconboxwithtext(
                          icon: 'assets/images/Vector (4).png',
                          text: 'Schedule',
                          onpress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Schedule()));
                          },
                        ),
                        iconboxwithtext(
                          icon: 'assets/images/Vector (6).png',
                          text: 'Copuns',
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Add_Post_Pic_Copuns()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconboxwithtext(
                          icon: 'assets/images/Vector (7).png',
                          text: 'Photo&Gallery',
                          onpress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Posts()));
                          },
                        ),
                        iconboxwithtext(
                          icon: 'assets/images/chat.png',
                          text: 'Message',
                          onpress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Chat()));
                          },
                        ),
                        iconboxwithtext(
                          icon: 'assets/images/Vector (8).png',
                          text: 'Call',
                          onpress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Call()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class iconboxwithtext extends StatelessWidget {
  String icon;
  String text;
  Function()? onpress;
  iconboxwithtext({
    required this.icon,
    required this.text,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF2F5FC),
          ),
          child: IconButton(
            icon: Image.asset(
              '$icon',
              height: 26,
              width: 24,
            ),
            onPressed: onpress,
          ),
        ),
        Text(
          '$text',
          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.50)),
        ),
      ],
    );
  }
}
