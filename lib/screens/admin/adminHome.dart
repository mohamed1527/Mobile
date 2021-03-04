import 'package:MOBILE/screens/welcome.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:MOBILE/widget/admin/adminPage.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Home Page'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            )
          ],
        ),
        body: AdminPage());
  }
}
