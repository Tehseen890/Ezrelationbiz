import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/Ez Business Management.png')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              //    Navigator.of(context).pushNamed(ManageProducts.routename);
            },
          ),
          ListTile(
            leading: ImageIcon(AssetImage('assets/images/Vector (16).png')),
            title: Text('Document'),
            onTap: () {
              //    Navigator.of(context).pushNamed(ManageProducts.routename);
            },
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.30),
            ),
          ),
          ListTile(
            leading: ImageIcon(AssetImage('assets/images/Vector (15).png')),
            title: Text('Support'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              //    Navigator.of(context).pushNamed(ManageProducts.routename);
            },
          ),
          ListTile(
            leading:
                ImageIcon(AssetImage('assets/images/bx_log-out-circle.png')),
            title: Text('Logout'),
            onTap: () {
              //    Navigator.of(context).pushNamed(ManageProducts.routename);
            },
          ),
        ],
      ),
    );
  }
}
