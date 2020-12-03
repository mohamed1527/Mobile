import 'package:flutter/material.dart';

  void main() => runApp(new Profile());

  class Profile extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stack Demo',
        home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          
          title: Text('Profile')),
          body:new StackDemo(),
      ));
    }
  }

  class StackDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:300)),
                Expanded(
                  child: Container(
                    child: Column(
                      children:[ 
                        Text('01003456789',
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        ),
                    ),
                    Text('Malak Ahmed',
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        ),
                    ),
                    Text('Senior year faculty of Computer science',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        ),
                    )
                      ],
                )
                )
                )
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
                  image:DecorationImage(
                  image:new AssetImage('images/photo.jpg'),
                  fit: BoxFit.fill,
        )
                ),
              ),
            ) 
             ],
      );
    }
  }