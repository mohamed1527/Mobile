import 'package:flutter/material.dart';

void main() {
  runApp(LostItems());
}

class LostItems extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'F'];
  final List<String> names = <String>[
    'Mohamed',
    'Ahmed',
    'Seif',
    'Khaled',
    'Omar'
  ];
  final List<String> dates = <String>[
    '25/12/2020',
    '16/9/2020',
    '3/7/2020',
    '12/4/2020',
    '10/5/2020'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Items lost'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('Item ${entries[index]}',
                        style: new TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('lost by ${names[index]}',
                        style: new TextStyle(
                            fontSize: 15.0, fontStyle: FontStyle.italic)),
                  ]),
                  Spacer(flex: 2),
                  Text('${dates[index]}'),
                ],
              ),
            );
          }),
    ));
  }
}
