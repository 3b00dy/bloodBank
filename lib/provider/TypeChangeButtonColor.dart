// ignore_for_file: file_names

import 'dart:convert';

import 'package:bankblood/models/hopsital_banks.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../statics.dart';

class TypeChangeButtonColor with ChangeNotifier{
  late String locationByType;
  String selected='';
  bool placeSelectedByType=false;
  bool typeSelectedByType=false;

  place(){
    placeSelectedByType=true;
    debugPrint('type $placeSelectedByType');

    notifyListeners();
  }
  selection(bloodType){
    selected=bloodType;
    typeSelectedByType=true;
    debugPrint('type $bloodType');
    notifyListeners();
  }
  List<HospitalBanks>? hospitalsList = [];

  bool load = true;
  int? length;

  fetchBanksByType() async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/banksOnType/$locationByType/$selected');
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