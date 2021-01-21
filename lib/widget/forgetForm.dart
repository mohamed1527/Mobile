import 'package:flutter/material.dart';

class forgetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Flexible(
                  child: Text(
                    'Forget your password',
                    textScaleFactor: 2.8,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.email),
                labelText: 'Email ',
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
                width: 200,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text('Reset'),
                  onPressed: () {},
                )),
          )
        ],
      ),
    );
  }
}
