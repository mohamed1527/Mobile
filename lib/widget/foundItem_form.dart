import 'package:MOBILE/models/LostItem.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:MOBILE/provider/modelHud.dart';
import 'package:MOBILE/services/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class FoundItemForm extends StatefulWidget {
  @override
  FoundItemFormState createState() => FoundItemFormState();
}

class FoundItemFormState extends State<FoundItemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController dateCtl = TextEditingController();
  bool loading = false;
  File image;
  String imgUrl;
  final _store = Store();
  String name, phone, descreption, lostdate;
  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'images/MIU.jpg',
                    width: 240.4,
                    height: 80,
                  )),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'name of item',
                  prefixIcon: Icon(Icons.perm_identity),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter name of item';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'phone',
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
                  RegExp regExp = new RegExp(pattern);

                  if (value.isEmpty || !regExp.hasMatch(value)) {
                    return 'Please enter valid  phone';
                  }
                  return null;
                },
                onSaved: (value) {
                  phone = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'descreption',
                  prefixIcon: Icon(Icons.description),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter descreption of item';
                  }
                  return null;
                },
                onSaved: (value) {
                  descreption = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Found Date',
                  labelText: 'Found Date',
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2100));
                  dateCtl.text = date.toString();
                },
                validator: (value) {
                  value = dateCtl.text;
                  if (value.isEmpty) {
                    return 'Please enter Found date ';
                  }
                  return null;
                },
                onSaved: (value) {
                  lostdate = value;
                },
              ),
              InkWell(
                onTap: () => getImage(),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      image != null ? FileImage(image) : NetworkImage("null"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7.5),
                  child: Builder(
                    builder: (context) => FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text('Add found item'),
                        onPressed: () async {
                          final modelhud =
                              Provider.of<ModelHud>(context, listen: false);
                          modelhud.changeIsLoading(true);
                          if (_formKey.currentState.validate()) {
                            var storageimage = FirebaseStorage.instance
                                .ref()
                                .child(image.path);
                            var task = storageimage.putFile(image);
                            imgUrl = await (await task.onComplete)
                                .ref
                                .getDownloadURL();
                            try {
                              _formKey.currentState.save();
                              _store.addFoundtem(LostItem(
                                  name: name,
                                  descreption: descreption,
                                  phone: phone,
                                  image: imgUrl,
                                  lostDate: dateCtl.text));
                              Navigator.pushNamed(context, '/home');
                            } catch (e) {
                              modelhud.changeIsLoading(false);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(e.message),
                              ));
                            }
                          }
                          modelhud.changeIsLoading(false);
                        }),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
