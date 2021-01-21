import 'package:flutter/material.dart';
import '../widget/aboutUs.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: aboutUs(),
    );
  }
}
