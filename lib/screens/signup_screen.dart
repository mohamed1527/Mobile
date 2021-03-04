import 'package:MOBILE/provider/modelHud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/signup_Form.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SignUpPage());
  }
}
