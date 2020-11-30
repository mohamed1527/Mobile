import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Signup(),
  ));
}

class Signup extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Signup> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

@override
  void initState(){
    super.initState();
    fullNameController.addListener(() {print("Name Text Field:${fullNameController.text}");});
    userNameController.addListener(() {print("Name Text Field:${userNameController.text}");});
    passwordController.addListener(() {print("Name Text Field:${passwordController.text}");});
    emailController.addListener(() {print("Name Text Field:${emailController.text}");});
  }
  

  @override
  void dispose(){
    fullNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Miu Lost and Found',
                      style: TextStyle(
                          color: Colors.red,
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
                  child: TextField(
                    autofocus: true,
                    controller: fullNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: repeatPasswordController,
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
                      color: Colors.black,
                      child: Text('Sign up'),
                      onPressed: () {
                         return showDialog(context: context,
                        builder:(context){
                          return AlertDialog(
                            content:Text(' ${fullNameController.text}\n ${userNameController.text}\n ${emailController.text}\n ${passwordController.text}')
                          );
                      });
                      
                      },
                      )
                      ),
              ],
            )));
  }
}
