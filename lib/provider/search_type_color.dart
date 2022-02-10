import 'package:flutter/cupertino.dart';

class ChangeButtonColor with ChangeNotifier{
   String selected='';
   bool placeSelected=false;
   bool typeSelected=false;

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