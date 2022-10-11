import 'package:business_management/HomePages/Clientprofile.dart';
import 'package:business_management/Models/AddClients.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Clients extends StatefulWidget {
  bool seeall;
  Clients({
    Key? key,
    required this.seeall,
  }) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  bool inActiveSeeAll = false;
  var phNo = FirebaseAuth.instance.currentUser?.phoneNumber;
  @override
  void initState() {
    Provider.of<ClientsList>(context, listen: false).fetchclients(phNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clientslist = Provider.of<ClientsList>(context, listen: false).items;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 10),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: clientslist
                .length, //widget.seeall == true ? clientslist.length : 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 5, crossAxisSpacing: 0, mainAxisSpacing: 15,
              //  mainAxisExtent: 10,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ClientProfile()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF1FA0D0),
                      backgroundImage:
                          AssetImage('assets/images/unsplash_iEEBWgY_6lA.png'),
                    ),
                    Text(
                      '${clientslist[i].FullName}',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              );
            }),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('INACTIVE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            GestureDetector(
              onTap: () {
                setState(() {
                  inActiveSeeAll = !inActiveSeeAll;
                });
              },
              child: Text(
                'See All',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF1FA0D0)),
              ),
            ),
          ],
        ),
        //  GridView.builder(gridDelegate: sliver, itemBuilder: itemBuilder)
        SizedBox(height: 15),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: inActiveSeeAll ? 10 : 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 5, crossAxisSpacing: 0, mainAxisSpacing: 5,
              //  mainAxisExtent: 10,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ClientProfile()));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      backgroundImage:
                          AssetImage('assets/images/unsplash_iEEBWgY_6lA.png'),
                    ),
                    Text(
                      'Peter',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
