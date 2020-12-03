import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(Found());

class Found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Found Item Form ';
    return MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,

          /// error kan mawgod
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.black,
            title: Text(appTitle),
          ),
          body: SingleChildScrollView(
            child: FoundForm(),
          ),
        ));
  }
}

class FoundForm extends StatefulWidget {
  @override
  FoundFormState createState() {
    return FoundFormState();
  }
}

class FoundFormState extends State<FoundForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  File _image;
  void initState() {
    super.initState();
  }

  void open_camera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void open_gallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              minLines: 2,
              maxLines: 5,
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Descreption ',
                labelText: 'Descreption ',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Found Date',
                labelText: 'Found Date',
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
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2100));

                dateCtl.text = date.toIso8601String();
              },
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  open_gallery();
                },
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Text(
                      'choose image',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.insert_photo,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
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
                          content:
                              Text('Item information  is in processing.')));
                    }
                  },
                )),
          ]),
    );
  }
}
