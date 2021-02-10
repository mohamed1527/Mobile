import 'package:MOBILE/shared/loading.dart';
import 'package:flutter/material.dart';
import '../widget/signup_Form.dart';

final _formKey = GlobalKey<FormState>();

class SignupScreen extends StatelessWidget {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign up'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: SignUpPage());
  }
}
