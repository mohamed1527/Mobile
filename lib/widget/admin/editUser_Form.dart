import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class EditUser extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _store = Store();
  String _username, _email, _password, _fullname;
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;

    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit User'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'images/MIU.jpg',
                      width: 240.4,
                      height: 80,
                    )),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'UserName',
                    prefixIcon: Icon(Icons.perm_identity),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onSaved: (value) {
                    _username = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'FullName',
                    prefixIcon: Icon(Icons.perm_identity),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onSaved: (value) {
                    _fullname = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _store.editUser(
                          ({
                            kFullname: _fullname,
                            kEmail: _email,
                            kUsername: _username,
                            kPassword: _password,
                          }),
                          user.id);
                    }
                  },
                  child: Text('edit User'),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
