import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Lost Item Form ';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,

      /// yshyl el 3alama
      home: Scaffold(
        resizeToAvoidBottomPadding: false,

        /// error kan mawgod
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(appTitle),
        ),
        body: LostForm(),
      ),
    );
  }
}

class LostForm extends StatefulWidget {
  @override
  LostFormFormState createState() {
    return LostFormFormState();
  }
}

class LostFormFormState extends State<LostForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(0.0),
            //   width: double.infinity,

            child: Image.asset("images/lost2.JPG"),
          ),
          TextFormField(
            decoration: const InputDecoration(
              //contentPadding: EdgeInsets.all(10),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              icon: const Icon(Icons.person),
              hintText: 'Name of item',
              labelText: 'Name of item',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter name of item ';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Your Phone',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter  phone number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Lost Date',
              labelText: 'Lost Date',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));

              dateCtl.text = date.toIso8601String();
            },
          ),
          new Container(
              padding: const EdgeInsets.all(10),
              child: new RaisedButton(
                color: Colors.black87,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Item information  is in processing.')));
                  }
                },
              )),
        ],
      ),
    );
  }
}
