import 'package:flutter/material.dart';
import '../widget/foundItem_form.dart';

class FoundFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Found Form"),
      ),
      body: FoundItemForm(),
    );
  }
}
