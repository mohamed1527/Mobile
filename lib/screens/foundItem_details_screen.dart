import 'package:MOBILE/models/Founditem.dart';
import 'package:MOBILE/models/LostItem.dart';
import 'package:flutter/material.dart';

class FoundItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoundItem founditem = ModalRoute.of(context).settings.arguments;
    print(founditem.image);
    return Scaffold(
        appBar: AppBar(
          title: Text(founditem.name),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                founditem.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Card(
                //color: Theme.of(context).accentColor,
                child: Text('Phone:${founditem.phone}'),
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
                  'Descreption:${founditem.descreption}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                )),
            Text(
              'LostDate:${founditem.lostDate}',
              textScaleFactor: 1.4,
            )
          ]),
        ));
  }
}
