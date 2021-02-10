import 'package:MOBILE/main.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/screens/home.dart';
import 'package:MOBILE/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Welcome();
    } else {
      return Home();
    }
  }
}
