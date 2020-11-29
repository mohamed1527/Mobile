import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //yshyl el 3alama
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Forget your password',
                textScaleFactor: 2.8,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Confirm your email',
                textScaleFactor: 1.8,
              ),
              FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: Icon(
                  Icons.lock,
                  size: 100.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              labelText: 'Email ',
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
                width: 200,
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                      side: BorderSide(color: Colors.black)),
                  child: Text('Reset'),
                  onPressed: () {},
                )),
          )
        ],
      ),
    );
  }
}
