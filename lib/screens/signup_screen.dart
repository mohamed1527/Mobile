import 'package:flutter/material.dart';
import '../widget/signup_Form.dart';

final _formKey = GlobalKey<FormState>();

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SignUp());
  }
}
