import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/connection.dart';

Future<Map<String, dynamic>> httpGetUser(http.Client client,
    BuildContext context, String username, String password) async {
  ApiConnection conn = Provider.of<ApiConnection>(context, listen: false);
  Uri uri = Uri.parse('http://' + conn.ip + ':' + conn.port + '/login');

  var response = await client.post(uri,
      body: json.encode({
        'username': username,
        'password': password,
      }));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw "Unable to login, wrong user credentials";
  }
}

Future<Map<String, dynamic>> httpregisterUser(http.Client client,
    BuildContext context, String username, String password) async {
  ApiConnection conn = Provider.of<ApiConnection>(context, listen: false);
  Uri uri = Uri.parse('http://' + conn.ip + ':' + conn.port + '/user/newUser');

  var response = await client.post(
    uri,
    body: json.encode(
      {
        'username': username,
        'password': password,
        'userID': const Uuid().v4(),
      },
    ),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw "Unable to login, user exist maybe";
  }
}
