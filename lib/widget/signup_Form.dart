import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignUp(),
      ),
    );
  }
}*/

class SignUpPage extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordControlller = TextEditingController();

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Miu Lost and Found',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'images/MIU.jpg',
                      width: 240.4,
                      height: 80,
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter FullName';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter UserName';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ',
                    ),
                    validator: (value) {
                      if (value.isEmpty ||
                          !value.contains("@miuegypt") ||
                          !value.endsWith(".edu.eg")) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordControlller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Retype Password',
                      ),
                      validator: (value) {
                        if (value != _passwordControlller) {
                          return "Password doesnt match ";
                        }
                        return null;
                      }),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text('Sign up'),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            //invalid
                            return;
                          }
                          _formKey.currentState.save();
                        })),
              ],
            )));
  }
}
