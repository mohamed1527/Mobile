import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/LostItem.dart';
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

  addLostItem(LostItem lostItem) {
    _firestore.collection(kLostItemCollication).add({
      'image': lostItem.image,
      'lostdate': lostItem.lostDate,
      'name': lostItem.name,
      'descreption': lostItem.descreption
    });
  }

  Stream<QuerySnapshot> loadUsers() {
    return _firestore.collection(kUserCollication).snapshots();
  }
}
