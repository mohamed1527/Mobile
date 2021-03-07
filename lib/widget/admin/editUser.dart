import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class EditUser extends StatelessWidget {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  users.add(User(
                      username: data[kUsername],
                      fullname: data[kFullname],
                      email: data[kEmail]));
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Text(users[index].email),
                  itemCount: users.length,
                );
              } else {
                return Center(
                  child: Text('Loading.....'),
                );
              }
            }),
      ),
    );
  }
}
