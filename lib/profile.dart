import 'package:flutter/material.dart';

  void main() => runApp(new MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stack Demo',
        home: new StackDemo(),
      );
    }
  }

  class StackDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Profile'),),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // background image and bottom contents
            Column(
              children: <Widget>[
                Container(
                  height: 200.0,color: Colors.orange,
                  child: Center(
                    child: Image.asset(
                'images/photo2.jpg',
                width: 440.4,
               // height: 200,
                fit: BoxFit.cover,
        ),
                    
                  ),
                ),
                Expanded(
                  child: Container(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[ 
                       
                        Text('01003456789',
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[300],
                        ),
                    ),
                    Text('Malak Ahmed',
                        style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[300],
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
            // Profile image
            Positioned(
              top: 150.0,
               // (background container size) - (circle height / 2)
              child: Container(
                height: 100.0,
                width: 100.0,
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
        ),
      );
    }
  }