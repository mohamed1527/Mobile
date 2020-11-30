import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Signup(),
  ));
}
final _formKey = GlobalKey<FormState>();

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
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Form(
          key: _formKey,
          child:Padding(
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter FullName';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',  
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter UserName';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ',
                    ),
                    validator: (value){
                      if(value.isEmpty || !value.contains("@miuegypt") || !value.endsWith(".edu.eg")){
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value){
                      if(value.isEmpty){
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
                    controller: repeatPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Retype Password',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter UserName';
                      }
                      if(value != passwordController.text){
                        return 'Password are not matching';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      child: Text('Sign up'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
  
                         return showDialog(context: context,
                        builder:(context){
                          return AlertDialog(
                            content:Text(' ${fullNameController.text}\n ${userNameController.text}\n ${emailController.text}\n ${passwordController.text}')
                          );
                      });
                        }
                      },
                      )
                      ),
              ],
            )
            
            )
    )
    );
  }
}
