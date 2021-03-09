import 'package:flutter/material.dart';
import 'founditem_screen.dart';
import 'lost_item_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectindex = 0;
  @override
  void initState() {
    _pages = [
      {'page': LostItemScreen(), 'title': 'LostItems'},
      {'page': FoundItemScreen(), 'title': 'Found items'},
    ];
    super.initState();
  }

  void _SelectPage(int value) {
    setState(() {
      _selectindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectindex]['title'])),
      body: _pages[_selectindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Lost Items"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
            title: Text("Found Items"),
          ),
        ],
      ),
      //    drawer: MainDrawer()
    );
  }
}
