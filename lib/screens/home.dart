import 'package:MOBILE/screens/FoundForm_screen.dart';
import 'package:MOBILE/screens/LostForm_screen.dart';
import 'package:MOBILE/screens/welcome.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:MOBILE/widget/maindrawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _drawerKey.currentState.openDrawer();
              }),
          title: Text('MIU Lost And Found'),
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
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Image.asset(
                'images/MIU.jpg',
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            size: 70,
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/foundform');
                          }),
                      flex: 1,
                    ),
                    Expanded(
                      child: IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.black,
                            size: 70,
                          ),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/lostform');
                          }),
                      flex: 1,
                    )
                  ]),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'I Found Something',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'I Lost Something',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
        )),
        drawer: MainDrawer());
  }
}
