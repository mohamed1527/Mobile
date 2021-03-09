import 'package:MOBILE/provider/adminMode.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/signup_screen.dart';
import '../screens/forget_form_screen.dart';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      print("Name Text Field:${nameController.text}");
    });
    passwordController.addListener(() {
      print("Name Text Field:${passwordController.text}");
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final adminpassword = 'admin1234';
  bool isAdmin = false;
  bool loading = false;
  String email = '';
  String password = '';
  @override
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
                              fontSize: 20,
                              fontFamily: 'Pacifico'),
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
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return 'Please enter valid Email';
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
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 5) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/forget');
                      },
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Forgot Password',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'Pacifico')),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Builder(
                        builder: (context) => FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            child: Text('Login'),
                            onPressed: () async {
                              final modelhud =
                                  Provider.of<ModelHud>(context, listen: false);
                              modelhud.changeIsLoading(true);
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                if (Provider.of<AdminMode>(context,
                                        listen: false)
                                    .isAdmin) {
                                  if (password == adminpassword) {
                                    try {
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      modelhud.changeIsLoading(false);

                                      Navigator.pushNamed(
                                          context, '/adminHomePage');
                                    } catch (e) {
                                      modelhud.changeIsLoading(false);
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(e.toString()),
                                      ));
                                    }
                                  } else {
                                    modelhud.changeIsLoading(false);
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Something went wrong'),
                                    ));
                                  }
                                } else {
                                  try {
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);

                                    if (result != null) {
                                      Navigator.pushNamed(context, '/home');
                                      print(result);
                                    }
                                  } catch (e) {
                                    modelhud.changeIsLoading(false);
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(e.message),
                                    ));
                                  }
                                }
                              }
                              modelhud.changeIsLoading(false);
                            }),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Row(
                          children: <Widget>[
                            Text('Does not have account?',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Pacifico')),
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text(
                                'Sign up',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                //signup page
                                Navigator.pushNamed(context, '/signup');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(true);
                                },
                                child: Text(
                                  'I am an Admin',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(false);
                                },
                                child: Text(
                                  'I am an Student',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
