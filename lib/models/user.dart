import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class Users with ChangeNotifier {
  Future<void> add({
    String id,
    String fullname,
    String username,
    String email,
    String password,
  }) async {
    final url =
        "https://miu-lost-and-found-default-rtdb.firebaseio.com/user.json";
    try {
      http.Response res = await http.post(url,
          body: json.encode({
            "id": id,
            "fullname": fullname,
            "username": username,
            "email": email,
            "password": password,
          }));
      //  print(json.decode(res.body));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
