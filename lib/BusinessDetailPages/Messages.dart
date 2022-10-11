import 'package:business_management/HomePages/Chat.dart';
import 'package:business_management/Widgets/Drawer.dart';
import 'package:business_management/Widgets/Search.dart';
import 'package:business_management/Widgets/bottom.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Message',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Search(),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Chat()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    //   padding: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(0.18),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //     height: MediaQuery.of(context).size.height * 0.12,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/images/unsplash_iEEBWgY_6lA.png'),
                      ),
                      title: Text('Peter Parker'),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur elit lectus adipiscing lectus augue penatibus eros mass.',
                        maxLines: 1,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Yesterday',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.50),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF1FA0D0)),
                            child: Text(
                              '5',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottom(currentindex: 2),
    );
  }
}
