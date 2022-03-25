import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String userID = '';
  String username = '';
  String password = '';

  User.noValues();

  User({
    required this.userID,
    required this.password,
    required this.username,
  });
}
