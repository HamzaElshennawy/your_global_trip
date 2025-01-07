import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/conditions_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Global Trip",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.gavel, color: Colors.black),
            title: Text(
              'Conditions',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConditionsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.black),
            title: Text(
              'Privacy',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.black),
            title: Text(
              'About',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Divider(color: Colors.black54, thickness: 1),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Add your logout logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
