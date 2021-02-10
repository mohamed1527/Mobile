import 'package:flutter/material.dart';

class ItemsData extends StatelessWidget {
  //final List<Item> _allitems = allitems();

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: new Text(
                "List of Items",
                style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: getHomePageBody(context))));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new ListTile(
          leading: new Image.asset(
            "images/",
            fit: BoxFit.cover,
            width: 100.0,
          ),
          title: new Text(
            "",
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("saa",
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal)),
                new Text('StudentName: ',
                    style: new TextStyle(
                        fontSize: 11.0, fontWeight: FontWeight.normal)),
              ]),
          onTap: () {
            //  _showSnackBar(context, Item);
          },
        )
      ],
    ));
  }

  // void _showSnackBar(BuildContext context, Item allitem) {}
}
