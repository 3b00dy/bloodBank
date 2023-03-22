import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GetProfile with ChangeNotifier {
  // ignore: non_constant_identifier_names
  String? first_name,last_name,gender,bloodType,address,phoneNumber,email
      ,birthdate;
  getProfile() async{
    SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
    first_name= tokenValueSet.getString('first_name');
    last_name= tokenValueSet.getString('last_name');
    gender=tokenValueSet.getString('gender');
    bloodType=tokenValueSet.getString('bloodType');
    address= tokenValueSet.getString('address');
    phoneNumber=tokenValueSet.getString('phoneNumber');
    email=tokenValueSet.getString('email');
    birthdate=tokenValueSet.getString('birthdate')??'0';
  }
}
