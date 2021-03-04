import 'package:MOBILE/widget/admin/addUser_Form.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: AddUserScreen());
  }
}
