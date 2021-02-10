import 'package:MOBILE/services/auth.dart';
import 'package:MOBILE/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
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
                          if (value.isEmpty || value.length < 5) {
                            return 'Please enter valid UserName';
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
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return 'Please enter valid Password';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Retype Password',
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text('Sign up'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print(email);
                            print(password);
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'please enter valid email';
                                loading = false;
                              });
                            }
                            Navigator.pushNamed(context, '/login');
                          }
                        },
                      ),
                    )
                  ],
                )));
  }
}
