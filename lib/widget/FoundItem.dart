import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/Founditem.dart';
import 'package:MOBILE/models/LostItem.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class FoundItems extends StatefulWidget {
  @override
  _FoundItemState createState() => _FoundItemState();
}

class _FoundItemState extends State<FoundItems> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadFoundItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FoundItem> found = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              found.add(FoundItem(
                id: doc.documentID,
                name: data[kFoundname],
                image: data[kFoundImage],
                descreption: data[kFoundDescreption],
                lostDate: data[kFounddate],
                phone: data[kphone],
              ));
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/founditemdetails',
                        arguments: found[index]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            ClipRRect(
                              // help n3ml cut ll 7aaga
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Image.network(
                                found[index].image,
                                height: 450,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  width: 220,
                                  color: Colors.black54,
                                  child: Text(
                                    found[index].name,
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )),
              itemCount: found.length,
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        });
  }
}
