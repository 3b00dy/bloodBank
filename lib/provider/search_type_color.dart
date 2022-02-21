import 'dart:convert';

import 'package:bankblood/models/hopsital_banks.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../statics.dart';

class ChangeButtonColor with ChangeNotifier{




  late String location;
   String selected='';
   bool placeSelected=false;
   bool typeSelected=false;

place(){
  placeSelected=true;
  debugPrint('type $placeSelected');

  notifyListeners();
}
selection(bloodType){
  selected=bloodType;
  typeSelected=true;
  debugPrint('type $bloodType');
  notifyListeners();
}





  late String locationByType;
  String selectedByType='';
  bool placeSelectedByType=false;
  bool typeSelectedByType=false;

  placeByType(){
    placeSelectedByType=true;
    debugPrint('type $placeSelectedByType');

    notifyListeners();
  }
  selectionByType(bloodType){
    selectedByType=bloodType;
    typeSelectedByType=true;
    debugPrint('type $bloodType');
    notifyListeners();
  }
   List<HospitalBanks>? hospitalsList = [];

   bool load = true;
   int? length;

   fetchBanks() async {
     http.Response response;
     try {
       var url = Uri.parse('$baseUrl/api/banks/$location/$selected');
       response = await http.get(url);
       var jsonModels = json.decode(response.body);
       debugPrint('hospitals....$jsonModels');
       hospitalsList = jsonModels
           .map<HospitalBanks>(
               (_modelJson) => HospitalBanks.fromJson(_modelJson))
           .toList();


       debugPrint('hospitals..... $hospitalsList');


       notifyListeners();

       return hospitalsList;
     } catch (error) {
       rethrow;
     }
   }

  fetchBanksByType() async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/banksOnType/$location/$selectedByType');
      response = await http.get(url);
      var jsonModels = json.decode(response.body);
      debugPrint('hospitals....$jsonModels');
      hospitalsList = jsonModels
          .map<HospitalBanks>(
              (_modelJson) => HospitalBanks.fromJson(_modelJson))
          .toList();


      debugPrint('hospitals..... $hospitalsList');


      notifyListeners();

      return hospitalsList;
    } catch (error) {
      rethrow;
    }
  }

}