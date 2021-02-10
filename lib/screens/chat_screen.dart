import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  static List<String> messages = [
    "I wanted to have a button which looks like icon with a text that is able to put at the bottom of the screen",
    "I wanted to have a button which looks like icon with a text that is able to put at the bottom of the screen",
    "xxxx",
    "yyyyyy",
    "llllll",
  ];
  final myController = TextEditingController();
  final ScrollController scrollController = new ScrollController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          Container(
            height: MediaQuery.of(context).size.height - 191.2,
            child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return leftMessage(context, messages[index]);
                  } else {
                    return rightMessage(context, messages[index]);
                  }
                }),
          ),
          Container(
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
        ],
      ),
    );
  }

  sendMessage() {
    if (myController.text.isNotEmpty) {
      messages.add(myController.text);
      scrollController.animateTo(
          scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeOut);
      myController.clear();
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
