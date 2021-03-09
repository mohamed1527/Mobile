import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/LostItem.dart';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/screens/lostitem_details_screen.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LostItems extends StatefulWidget {
  @override
  _LostItemState createState() => _LostItemState();
}

class _LostItemState extends State<LostItems> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadLostItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LostItem> lost = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              lost.add(LostItem(
                id: doc.documentID,
                name: data[klostname],
                image: data[kimage],
                descreption: data[kdescription],
                lostDate: data[klostdate],
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
                    Navigator.pushNamed(context, '/itemdetails',
                        arguments: lost[index]);
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
                                lost[index].image,
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
                                    lost[index].name,
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
              itemCount: lost.length,
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        });
  }
}
