import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   final mealId = ModalRoute.of(context).settings.arguments as String;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("Item details"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                "images/flash.png",
                //   selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Card(
                color: Theme.of(context).accentColor,
                child: Text("Mobile Number: 0101255"),
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
                child: Text("Descrption: ")),
            Text(
              "Found Date: 22/12/2020",
              textScaleFactor: 1.4,
            )
          ]),
        ));
  }
}
