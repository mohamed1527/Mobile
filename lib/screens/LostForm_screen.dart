import 'package:flutter/material.dart';
import '../widget/lostItem_form.dart';

class LostFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Lost Form"),
      ),
      body: LostItemForm(),
    );
  }
}
