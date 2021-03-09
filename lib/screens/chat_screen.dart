import 'package:flutter/material.dart';
import 'package:MOBILE/models/message.dart';
import 'package:MOBILE/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MOBILE/models/user.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final myController = TextEditingController();
  final ScrollController scrollController = new ScrollController();
  final _store = Store();
  var sender_id = "1";
  var receiver_id = "2";
  List<Message> messages = [];
  var firsttime = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void userId() async {
    final FirebaseUser user = await auth.currentUser();
    sender_id = user.uid;
    // print(uid);
  }

  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("Messages").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      if (sender_id == a['sender_id'] || sender_id == a['receiver_id']) {
        Message message =
            Message(a['message'], a['sender_id'], a['receiver_id']);
        messages.add(message);
      }
      // print(a['message']);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (firsttime == false) {
      firsttime = true;
      getDocs();
    }

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Center(
          child: Text(
            'Chat',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            flex: 11,
            child: new Container(
              height: MediaQuery.of(context).size.height - 170,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (sender_id == messages[index].sender_id) {
                      return rightMessage(context, messages[index].message);
                    } else {
                      return leftMessage(context, messages[index].message);
                    }
                  }),
            ),
          ),
          new Expanded(
            flex: 2,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: new TextField(
                        controller: myController,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              setState(sendMessage);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  scroll() {
    scrollController.animateTo(scrollController.position.maxScrollExtent + 1000,
        duration: const Duration(milliseconds: 50), curve: Curves.easeOut);
  }

  sendMessage() {
    if (myController.text.isNotEmpty) {
      Message message = Message(myController.text, sender_id, receiver_id);
      messages.add(message);
      scroll();
      myController.clear();
      _store.addMessage(message);
    }
  }

  Widget rightMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment(MediaQuery.of(context).size.width / 1000 + 0.5,
          MediaQuery.of(context).size.height / 1000 + 0.4),
      child: Container(
        child: Text(
          message,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 70, top: 5, bottom: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget leftMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment(MediaQuery.of(context).size.width / 1000 - 1.3,
          MediaQuery.of(context).size.height / 1000 + 0.4),
      child: Container(
        child: Text(
          message,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 70),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
