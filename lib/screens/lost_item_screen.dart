import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/widget/LostItem.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LostItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(body: LostItems()),
    );
  }
}
