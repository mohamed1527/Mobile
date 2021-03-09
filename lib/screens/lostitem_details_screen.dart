import 'package:MOBILE/models/LostItem.dart';
import 'package:flutter/material.dart';

class LostItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LostItem lostitem = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(lostitem.name),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                lostitem.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Card(
                //color: Theme.of(context).accentColor,
                child: Text('Phone:${lostitem.phone}'),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                child: Text(
                  'Descreption:${lostitem.descreption}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                )),
            Text(
              'LostDate:${lostitem.lostDate}',
              textScaleFactor: 1.4,
            )
          ]),
        ));
  }
}
