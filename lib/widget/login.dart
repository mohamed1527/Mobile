import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../screens/forget_form_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Please enter valid UserName';
                    }
                    return null;
                  }),
            ),
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
                  }),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgetPassScreen()));
              },
              textColor: Theme.of(context).primaryColor,
              child: Text('Forgot Password', style: TextStyle(fontSize: 20)),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text('Login'),
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text(
                                  ' ${nameController.text}\n ${passwordController.text}'));
                        });
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Does not have account?', style: TextStyle(fontSize: 20)),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ));
  }
}
