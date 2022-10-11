import 'package:business_management/Add_Post_pages/Add_Post.dart';
import 'package:business_management/Add_Post_pages/Add_pic.dart';
import 'package:business_management/Add_Post_pages/Add_Coupons.dart';
import 'package:flutter/material.dart';

class Add_Post_Pic_Copuns extends StatelessWidget {
  const Add_Post_Pic_Copuns({Key? key}) : super(key: key);

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
          'Business Page',
          style: TextStyle(color: Color(0xFF1FA0D0)),
        ),
      ),
      body: Column(
        children: [
          containerr(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF2F5FC),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Add_Post.routename, arguments: false);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/Vector (14).png'),
                      color: Color(0xFF1FA0D0),
                    ),
                  ),
                ),
                Text('Add Post')
              ],
            ),
          ),
          containerr(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add_Pic()));
                  },
                  icon: Image.asset(
                    'assets/images/Vector (11).png',
                    color: Color(0xFF1FA0D0),
                  ),
                ),
                Text('Add Gallery')
              ],
            ),
          ),
          containerr(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add_Coupons()));
                  },
                  icon: ImageIcon(
                    AssetImage('assets/images/coupon 1 (2).png'),
                    color: Color(0xFF1FA0D0),
                    size: 100,
                  ),
                ),
                Text('Add Copuns')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class containerr extends StatelessWidget {
  Widget child;
  containerr({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 50),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.18),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
