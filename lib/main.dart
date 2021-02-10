import 'package:MOBILE/screens/FoundForm_screen.dart';
import 'package:MOBILE/screens/LostForm_screen.dart';
import 'package:MOBILE/screens/MyProfile_screen.dart';
import 'package:MOBILE/screens/about_us_screen.dart';
import 'package:MOBILE/screens/forget_form_screen.dart';
import 'package:MOBILE/screens/founditem_screen.dart';
import 'package:MOBILE/screens/home.dart';
import 'package:MOBILE/screens/item_details_screen.dart';
import 'package:MOBILE/screens/itemsdata_screen.dart';
import 'package:MOBILE/screens/login_screen.dart';
import 'package:MOBILE/screens/lost_item_screen.dart';
import 'package:MOBILE/screens/signup_screen.dart';
import 'package:MOBILE/screens/tabs_screen.dart';
import 'package:MOBILE/screens/wrapper.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red[900]),
        routes: {
          '/signup': (context) => SignupScreen(),
          '/login': (context) => LoginScreen(),
          '/aboutus': (context) => AboutUsScreen(),
          '/profile': (context) => ProfileScreen(),
          '/lostitem': (context) => LostItemScreen(),
          '/lostform': (context) => LostFormScreen(),
          '/founditem': (context) => FoundItemScreen(),
          '/foundform': (context) => FoundFormScreen(),
          '/itemdetails': (context) => ItemDetailScreen(),
          '/forget': (context) => ForgetPassScreen(),
          '/itemdata': (context) => ItemsData(),
          '/tabs': (context) => TabsScreen(),
          '/home': (context) => Home(),
        },
        home: Wrapper(),
      ),
    );
  }
}
