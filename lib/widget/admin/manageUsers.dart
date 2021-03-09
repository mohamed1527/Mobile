import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class ManageUsers extends StatefulWidget {
  @override
  _ManageUsersState createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Users Table"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> users = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                users.add(User(
                    id: doc.documentID,
                    username: data[kUsername],
                    fullname: data[kFullname],
                    email: data[kEmail]));
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTapUp: (details) async {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.width - dx;
                      double dy2 = MediaQuery.of(context).size.width - dy;
                      await showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            MyPopupMenuItem(
                              onClick: () {
                                Navigator.pushNamed(context, "/edituser",
                                    arguments: users[index]);
                              },
                              child: Text('Edit User'),
                            ),
                            MyPopupMenuItem(
                              onClick: () {
                                final modelhud = Provider.of<ModelHud>(context,
                                    listen: false);
                                modelhud.changeIsLoading(true);
                                _store.deleteUser(users[index].id);
                                modelhud.changeIsLoading(false);
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                            MyPopupMenuItem(
                              onClick: () {
                                Navigator.pushNamed(context, "/chat",
                                    arguments: users[index]);
                              },
                              child: Text('Chat with User'),
                            ),
                          ]);
                    },
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Text('Fullname:${users[index].fullname}',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .6,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      users[index].email,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //Text('${users[index].username}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: users.length,
              );
            } else {
              return Center(child: Text('Loading...'));
            }
          },
        ),
      ),
    );
  }
}

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({@required this.child, @required this.onClick})
      : super(child: child);
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      MyPopupMenuItemState();
}

class MyPopupMenuItemState<T, PopupMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  void handleTap() {
    widget.onClick();
  }
}
