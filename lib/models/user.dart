import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String uid;
  final String id;
  final String fullname;
  final String username;
  final String email;
  final String password;
  final String type;
  final DateTime createdAt;
  User({
    this.uid,
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.type,
    this.createdAt,
  });
}
