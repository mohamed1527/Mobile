import 'package:MOBILE/constants.dart';
import 'package:MOBILE/models/LostItem.dart';
import 'package:MOBILE/models/user.dart';
import 'package:MOBILE/models/message.dart';
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
      'descreption': lostItem.descreption,
      'phone': lostItem.phone,
    });
  }

  addMessage(Message message) {
    _firestore.collection(KMessagesCollication).add({
      'message': message.message,
      'sender_id': message.sender_id,
      'receiver_id': message.receiver_id,
    });
  }

  Stream<QuerySnapshot> loadUsers() {
    return _firestore.collection(kUserCollication).snapshots();
  }

  Stream<QuerySnapshot> loadLostItems() {
    return _firestore.collection(kLostItemCollication).snapshots();
  }

  Stream<QuerySnapshot> loadFoundItems() {
    return _firestore.collection(kFoundItemCollication).snapshots();
  }

  addFoundtem(LostItem foundItem) {
    _firestore.collection(kFoundItemCollication).add({
      'image': foundItem.image,
      'foundate': foundItem.lostDate,
      'name': foundItem.name,
      'descreption': foundItem.descreption,
      'phone': foundItem.phone,
    });
  }

  deleteUser(documentID) {
    _firestore.collection(kUserCollication).document(documentID).delete();
  }

  editUser(data, documentID) {
    _firestore
        .collection(kUserCollication)
        .document(documentID)
        .updateData(data);
  }
}
