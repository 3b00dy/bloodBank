// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class TypeChangeButtonColor with ChangeNotifier{
  String selected='';
  bool placeSelected=false;
  bool typeSelected=false;

  String A='A+';
  place(){
    placeSelected=true;
    notifyListeners();
  }
  selection(bloodType){
    selected=bloodType;
    typeSelected=true;
    notifyListeners();
  }

}