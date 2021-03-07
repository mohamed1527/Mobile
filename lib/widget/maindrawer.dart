import '../screens/about_us_screen.dart';
import '../screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';
import '../screens/MyProfile_screen.dart';
import '../main.dart';

class MainDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/MIU.jpg",
                    ),
                    fit: BoxFit.contain)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home Page',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(
              'Items',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tabs');
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(
              'Chat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/chat');
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About Us',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Pacifico'),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/aboutus');
            },
          ),
        ],
      )),
    );
  }
}
