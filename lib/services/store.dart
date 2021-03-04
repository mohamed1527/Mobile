import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addUsers(User user) {
    _firestore.collection(kUserCollication).add({
      kUsername: user.username,
      kEmail: user.email,
      kPassword: user.password,
      kFullname: user.fullname,
      kcreatedAt: user.createdAt,
    });
  }
}
