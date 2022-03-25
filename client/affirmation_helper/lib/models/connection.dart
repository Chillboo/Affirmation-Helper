import 'package:flutter/cupertino.dart';

class ApiConnection extends ChangeNotifier {
  String port = '8080';
  String ip = '192.168.1.174';

  ApiConnection();

  void changeIpAndPort(String ip, String port) {
    this.ip = ip;
    this.port = port;
    notifyListeners();
  }
}
