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
  List<User> selectedUsers = new List<User>();
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
                    username: data[kUsername],
                    fullname: data[kFullname],
                    email: data[kEmail]));
              }
              return SingleChildScrollView(
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
                              users.sort(
                                  (a, b) => a.fullname.compareTo(b.fullname));
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
                              users.sort(
                                  (a, b) => a.username.compareTo(b.username));
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
                              users.sort((a, b) => a.email.compareTo(b.email));
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
              );
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
