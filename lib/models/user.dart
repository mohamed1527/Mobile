import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String fullname;
  final String username;
  final String email;
  final String password;
  final String type;
  final DateTime createdAt;
  User({
    this.uid,
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.type,
    this.createdAt,
  });
}
