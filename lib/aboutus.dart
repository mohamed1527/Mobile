
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AboutUs(),
  ));
}

class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('About Us',
          ),
          
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'images/Capture3.PNG',
                width: 411.4,
                height: 240,
                fit: BoxFit.cover,
                
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(Colors.black  , Icons.call, 'CALL'),
                BuildButtonColumn(Colors.black, Icons.near_me, 'ROUTE'),
                BuildButtonColumn(Colors.black, Icons.share, 'SHARE'),
              ]),
              TextDesc(),
              
            ],
            
          ),
        ),
      ),
    );
  }
}



Column BuildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        padding: EdgeInsets.only(bottom:5),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class TextDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
      ),
      child: Text(
        'Misr International University is an undergraduate private university located in ElObour city in Qalyubiyya Governorate.' 
        'Established in 1996, in Maadi, The University changed its location to km 28 Cairo-Ismailia Road.' 
        'Prof. Mohamed Shebl El komy is the university president.', 
        style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500),
        maxLines: null,
        softWrap: true,
      ),
    );
  }
}
