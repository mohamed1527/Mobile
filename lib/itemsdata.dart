import 'package:flutter/material.dart';
import 'item.dart';

void main() {
  runApp(ItemsData());
}



class ItemsData extends StatelessWidget {
  final List<Item> _allitems = allitems();

  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
        appBar: new AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
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
      itemCount: _allitems.length,
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
            "images/" + _allitems[index].image,
            fit: BoxFit.cover,
            width: 100.0,
          ),
          title: new Text(
            _allitems[index].name,
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_allitems[index].number,
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal)),
                new Text('StudentName: ${_allitems[index].studentname}',
                    style: new TextStyle(
                        fontSize: 11.0, fontWeight: FontWeight.normal)),
              ]),
          onTap: () {
            _showSnackBar(context, _allitems[index]);
          },
        )
      ],
    ));
  }

  void _showSnackBar(BuildContext context, Item allitem) {}
}
