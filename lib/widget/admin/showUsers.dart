import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class ShowUser extends StatefulWidget {
  @override
  ShowUserState createState() {
    return new ShowUserState();
  }
}

class ShowUserState extends State<ShowUser> {
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
                    crossAxisCount: 1,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
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
                                  final modelhud = Provider.of<ModelHud>(
                                      context,
                                      listen: false);
                                  modelhud.changeIsLoading(true);
                                  _store.deleteUser(users[index].id);
                                  modelhud.changeIsLoading(false);
                                  Navigator.pop(context);
                                },
                                child: Text('Delete'),
                              ),
                            ]);
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(
                              onSelectAll: (b) {},
                              sortColumnIndex: 1,
                              sortAscending: true,
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text("FullName"),
                                  numeric: false,
                                  onSort: (i, b) {
                                    print("$i $b");
                                    setState(() {
                                      users.sort((a, b) =>
                                          a.fullname.compareTo(b.fullname));
                                    });
                                  },
                                  tooltip: "To display fullname of the Name",
                                ),
                                DataColumn(
                                  label: Text("UserName"),
                                  numeric: false,
                                  onSort: (i, b) {
                                    print("$i $b");
                                    setState(() {
                                      users.sort((a, b) =>
                                          a.username.compareTo(b.username));
                                    });
                                  },
                                  tooltip: "To display username of the Name",
                                ),
                                DataColumn(
                                  label: Text("Email"),
                                  numeric: false,
                                  onSort: (i, b) {
                                    print("$i $b");
                                    setState(() {
                                      users.sort(
                                          (a, b) => a.email.compareTo(b.email));
                                    });
                                  },
                                  tooltip: "To display email of the Name",
                                ),
                              ],
                              rows: users
                                  .map(
                                    (name) => DataRow(
                                      selected: users.contains(name),
                                      onSelectChanged: (bool selected) {
                                        setState(() {
                                          if (selected)
                                            users.add(name);
                                          else
                                            users.remove(name);
                                        });
                                      },
                                      cells: [
                                        DataCell(
                                          Text(name.fullname),
                                          showEditIcon: false,
                                          placeholder: false,
                                        ),
                                        DataCell(
                                          Text(name.username),
                                          showEditIcon: false,
                                          placeholder: false,
                                        ),
                                        DataCell(
                                          Text(name.email),
                                          showEditIcon: false,
                                          placeholder: false,
                                        )
                                      ],
                                    ),
                                  )
                                  .toList()),
                        ),
                      )));
            } else {
              return Center(
                child: Text('Loading.....'),
              );
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
