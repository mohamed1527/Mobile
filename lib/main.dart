import 'screens/LostForm_screen.dart';
import 'screens/FoundForm_screen.dart';
import 'package:flutter/material.dart';
import 'widget/maindrawer.dart';

void main() => runApp(MyApp());

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red[900]),
        home: Scaffold(
            key: _drawerKey,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _drawerKey.currentState.openDrawer();
                  }),
              title: Text('MIU Lost And Found'),
            ),
            body: Column(
              children: [
                Padding(padding: EdgeInsets.all(8)),
                Image.asset(
                  'images/MIU.jpg',
                  width: 350.4,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoundFormScreen()),
                              );
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LostFormScreen()),
                              );
                            }),
                        flex: 1,
                      )
                    ]),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Text(
                      'I Found Something',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'I Lost Something',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ],
                )
              ],
            ),
            drawer: MainDrawer()));
  }
}
