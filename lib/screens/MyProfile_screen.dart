import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget stackBuilder() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 300)),
            Expanded(
                child: Container(
                    child: Column(
              children: [
                Text(
                  '01003456789',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Malak Ahmed',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Senior year faculty of Computer science',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            )))
          ],
        ),
        Positioned(
          top: 50.0,
          // (background container size) - (circle height / 2)
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                image: DecorationImage(
                  image: new AssetImage('images/photo.jpg'),
                  fit: BoxFit.fill,
                )),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        //    backgroundColor: Colors.red[900],
      ),
      body: Container(child: stackBuilder()),
    );
  }
}
