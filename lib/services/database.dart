import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference ref = Firestore.instance.collection('user');

  Future updateUserData(String username, String email, String password) async {
    return await ref.document(uid).setData({
      'username': username,
      'email': email,
      'passweod': password,
    });
  }
}
