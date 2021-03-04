import 'package:MOBILE/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Who will be used to communiate with firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Object based on FirebaseUser
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFireBaseUser(user));
  }

  // Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      print('here');
      print('email: ${email}');
      print('pass: ${password}');
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('res. ${result}');
      FirebaseUser user = result.user;

      return _userFromFireBaseUser(user);
    } catch (e) {
      print('here 2');
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
