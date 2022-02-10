import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier{
 String? dropdownValue;
 String hint='Choose type of blood';
 List items= [
   'A+',
   'A-',
   'B+',
   'B-',
   'AB+',
   'AB-',
   'O+',
   'O-',

 ];
setValue(val){

  dropdownValue=val;
  hint=val;
  notifyListeners();
}
}