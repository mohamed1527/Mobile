
import 'package:flutter/material.dart';

void main() => runApp(new App());
class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyApp();
}
class MyApp extends State<App> {
  int counter = 0;
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('MIU lost And Found'),
        backgroundColor: Colors.red,
      ),
      body: 
       
       Column(children: [
        Image.asset(
                'images/MIU.jpg',
                width: 350.4,
                height: 200,
                fit: BoxFit.fill,
        ),
        Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: const <Widget>[
    Icon(
      Icons.thumb_up,
      color: Colors.green,
      size: 150.0,   
    ),
    Icon(
      Icons.thumb_down,
      color: Colors.red,
      size: 150.0,
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
      ],)
        
      ),
      );
}
}