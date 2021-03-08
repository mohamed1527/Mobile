import 'package:MOBILE/provider/adminMode.dart';
import 'package:MOBILE/screens/FoundForm_screen.dart';
import 'package:MOBILE/screens/LostForm_screen.dart';
import 'package:MOBILE/screens/MyProfile_screen.dart';
import 'package:MOBILE/screens/about_us_screen.dart';
import 'package:MOBILE/screens/admin/addUser.dart';
import 'package:MOBILE/screens/admin/adminHome.dart';
import 'package:MOBILE/screens/chat_screen.dart';
import 'package:MOBILE/screens/forget_form_screen.dart';
import 'package:MOBILE/screens/foundItem_details_screen.dart';
import 'package:MOBILE/screens/founditem_screen.dart';
import 'package:MOBILE/screens/home.dart';
import 'package:MOBILE/screens/itemsdata_screen.dart';
import 'package:MOBILE/screens/login_screen.dart';
import 'package:MOBILE/screens/lost_item_screen.dart';
import 'package:MOBILE/screens/lostitem_details_screen.dart';
import 'package:MOBILE/screens/signup_screen.dart';
import 'package:MOBILE/screens/tabs_screen.dart';
import 'package:MOBILE/screens/wrapper.dart';
import 'package:MOBILE/services/auth.dart';
import 'package:MOBILE/widget/admin/editUser_Form.dart';
import 'package:MOBILE/widget/admin/manageUsers.dart';
import 'package:MOBILE/widget/admin/showUsers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'provider/modelHud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<ModelHud>(
              create: (context) => ModelHud(),
            ),
            ChangeNotifierProvider<AdminMode>(
              create: (context) => AdminMode(),
            )
          ],
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
              '/itemdetails': (context) => LostItemDetailScreen(),
              '/founditemdetails': (context) => FoundItemDetailScreen(),
              '/forget': (context) => ForgetPassScreen(),
              '/itemdata': (context) => ItemsData(),
              '/tabs': (context) => TabsScreen(),
              '/home': (context) => Home(),
              '/chat': (context) => ChatScreen(),
              '/adminHomePage': (context) => AdminHome(),
              '/adduser': (context) => AddUser(),
              '/edituser': (context) => EditUser(),
              '/manageuser': (context) => ManageUsers(),
              '/showuser': (context) => ShowUser(),
            },
            home: Wrapper(),
          ),
        ));
  }
}
