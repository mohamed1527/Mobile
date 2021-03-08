import 'package:flutter/material.dart';
import '../widget/forgetForm.dart';

class ForgetPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Forget Form "),
      ),
      body: forgetForm(),
    );
  }
}
