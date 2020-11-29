import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false, //yshyl el 3alama
        home: new LostItem());
  }
}

class LostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.black, title: Text("Lost items")),
        body: Column(children: <Widget>[
          Flexible(child: Container(
            child: ListView.builder(
                //    itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 80, minHeight: 80),
                    child: Image.asset(
                      'images/co.jpg',
                    ),
                  ),
                  subtitle: Text(
                    "Number:011245577 ",
                  ),
                  trailing: Text(
                    "lost Date :19-11-2020",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("copy book"));
            }),
          ))
        ]));
  }
}
