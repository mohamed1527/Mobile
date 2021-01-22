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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'Signup',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(
              'Items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
          ),
        ],
      )),
    );
  }
}
