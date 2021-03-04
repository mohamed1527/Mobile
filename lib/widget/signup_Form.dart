import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

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
    return ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
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
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'images/MIU.jpg',
                          width: 240.4,
                          height: 80,
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity_outlined),
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Retype Password',
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 7.5),
                      child: Builder(
                        builder: (context) => FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            child: Text('Sign up'),
                            onPressed: () async {
                              final modelhud =
                                  Provider.of<ModelHud>(context, listen: false);
                              modelhud.changeIsLoading(true);
                              if (_formKey.currentState.validate()) {
                                try {
                                  _formKey.currentState.save();
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  modelhud.changeIsLoading(false);
                                  Navigator.pushNamed(context, '/home');
                                } on PlatformException catch (e) {
                                  modelhud.changeIsLoading(false);
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(e.message),
                                  ));
                                }
                              }
                              modelhud.changeIsLoading(false);
                            }),
                      ),
                    )
                  ],
                ))));
  }
}
