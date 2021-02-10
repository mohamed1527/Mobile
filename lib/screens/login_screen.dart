import 'package:MOBILE/shared/loading.dart';
import 'package:flutter/material.dart';
import '../widget/login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login '),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Login());
  }
}
