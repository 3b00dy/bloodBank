import 'package:flutter/cupertino.dart';

class ConnectionStatus with ChangeNotifier{

late String connection;
  setConnectionState(value){
    connection=value;
    notifyListeners();
  }
}