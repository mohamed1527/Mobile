import 'package:MOBILE/services/auth.dart';
import 'package:MOBILE/shared/loading.dart';
import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../screens/forget_form_screen.dart';
import 'package:toast/toast.dart';

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
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Padding(
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
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
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
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
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
                  child:
                      Text('Forgot Password', style: TextStyle(fontSize: 20)),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      child: Text('Login'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print('Email: ${email}');
                          print('Password: ${password}');
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          print('Result: ${result}');
                          if (result == null) {
                            setState(() {
                              error = 'Enter a valid Email and Password';
                            });
                          } else {
                            Navigator.pushNamed(context, '/home');
                          }
                        }
                      }),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?',
                        style: TextStyle(fontSize: 20)),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup page
                        Navigator.pushNamed(context, '/signup');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            ));
  }
}
// import 'package:MOBILE/screens/home.dart';
// import 'package:MOBILE/services/auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class LogIn extends StatefulWidget {
//   @override
//   _LogInState createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     nameController.addListener(() {
//       print("Name Text Field:${nameController.text}");
//     });
//     passwordController.addListener(() {
//       print("Name Text Field:${passwordController.text}");
//     });
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();

//   String error = '';
//   // Text Field state
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       key: _formKey,
//       padding: EdgeInsets.all(10),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 'Miu Lost and Found',
//                 style: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30),
//               )),
//           Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.all(10),
//               child: Image.asset(
//                 'images/MIU.jpg',
//                 width: 240.4,
//                 height: 80,
//               )),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Email',
//               ),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Enter an email';
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {
//                 setState(() {
//                   email = value;
//                 });
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             child: TextFormField(
//               //obscureText: true,
//               controller: passwordController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Password',
//               ),
//               validator: (value) {
//                 if (value.length < 6) {
//                   return ('Enter a password 6+ chars long');
//                 } else {
//                   return null;
//                 }
//               },
//               obscureText: true,
//               onChanged: (value) {
//                 setState(() {
//                   password = value;
//                 });
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           RaisedButton(
//             onPressed: () async {
//               // usersRef
//               //     .where('UserEmail', isEqualTo: email)
//               //     .getDocuments()
//               //     .then((QuerySnapshot snapshot) {
//               //   snapshot.documents.forEach((DocumentSnapshot doc) {
//               //     print("Here ${doc.data['UserType']}");
//               //     foundType = doc.data['UserType'];
//               //     print("Here ${foundType}");
//               //   });
//               // });

//               if (_formKey.currentState.validate()) {
//                 print('Email: ${email}');
//                 print('Password: ${password}');
//                 dynamic result =
//                     await _auth.signInWithEmailAndPassword(email, password);
//                 print('Result: ${result}');
//                 if (result == null) {
//                   setState(() {
//                     error = 'Enter a valid Email and Password';
//                   });
//                 } else {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Home()));
//                 }
//               }
//             },
//             color: Colors.redAccent,
//             child: Text(
//               'Sign in',
//               style: TextStyle(),
//             ),
//           ),
//           SizedBox(
//             height: 12.0,
//           ),
//           Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
//           MaterialButton(
//             onPressed: () {
//               return null;
//             },
//             color: Colors.white,
//             textColor: Colors.black,
//             child: Text('Login with Google'),
//           ),
//         ],
//       ),
//     );
//   }
// }
