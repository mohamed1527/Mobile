
import 'package:flutter/material.dart';
import 'package:study/aboutus.dart';
import 'signup.dart';
import 'login.dart';
import 'found_form.dart';
import 'lost_form.dart';
import 'aboutus.dart';

void main() => runApp(new App());

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyApp();
}
class MyApp extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor:Colors.red[900]),
      home: Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          leading:IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
                  _drawerKey.currentState.openDrawer();
                }),
          
          title: Text('MIU lost And Found'),
          
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Icon(Icons.search),
              )
          ],
          
      ),
      
      body: 
       Column(children: [
         Padding(padding: EdgeInsets.all(8)),
         Image.asset(
                'images/MIU.jpg',
                width: 350.4,
                height: 200,
                fit: BoxFit.fill,
        ),
        Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children:  <Widget>[
    IconButton(
      icon: Icon(Icons.thumb_up ,),
     
      color: Colors.green,
      onPressed: () { Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoundForm()),
                      );
      }),
    IconButton(
      icon:Icon(Icons.thumb_down),
      
      color: Colors.red,
      onPressed: () { Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LostForm()),
                      );
      }
    ),
  ]
        ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: const <Widget>[
   Text('I Found Something',
    style: TextStyle( 
      fontSize: 20,
      fontWeight: FontWeight.w900),
      ),
      Text('I Lost Something',
    style: TextStyle( 
      fontSize: 20,
      fontWeight: FontWeight.w900),
      ),
      ],
      )
      ],
      ),
         drawer:Builder(
           builder:(context)=> Drawer(
           child:ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("images/MIU.jpg",),
                  fit: BoxFit.cover
                  )
              ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                    title: Text(
                      'Home Page',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {          
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => App()),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => App(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(
                      'Signup',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                      'Samples',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text(
                      'Categories',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'About Us',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                      },
                  ),
            ],
          )
          ), 
      ),
      ));
}
}