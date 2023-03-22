import 'dart:convert';

import 'package:bankblood/models/hopsital_banks.dart';
import 'package:bankblood/provider/loading_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../statics.dart';

class ChangeButtonColor with ChangeNotifier {
  late LoadingState loadingState;

  late String location;
  int defaultLength = 0;


  String selected = '';

  bool placeSelected = false;
  bool typeSelected = false;

  place() {
    placeSelected = true;
    notifyListeners();
  }

  selection(bloodType) {
    selected = bloodType;

    typeSelected = true;

    notifyListeners();
  }

  late String locationByType;
  String selectedByType = '';
  bool placeSelectedByType = false;
  bool typeSelectedByType = false;

  placeByType() {
    placeSelectedByType = true;
    debugPrint('type $placeSelectedByType');
    notifyListeners();
  }

  selectionByType(bloodType) {
    selectedByType = bloodType;
    typeSelectedByType = true;
    debugPrint('type $bloodType');
    notifyListeners();
  }

  List<HospitalBanks>? hospitalsList;

  bool load = true;
  int? length;

  fetchBanks() async {
    loadingState = LoadingState.loading;
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
      defaultLength = hospitalsList!.length;
      loadingState = LoadingState.finished;
      notifyListeners();
      return hospitalsList;
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
  // print('error ${error.toString()}');

  fetchBanksByType() async {
    loadingState = LoadingState.loading;

    http.Response response;
    try {
      var url =
          Uri.parse('$baseUrl/api/banksOnType/$locationByType/$selectedByType');
      response = await http.get(url);
      var jsonModels = json.decode(response.body);
      debugPrint('hospitals....$jsonModels');
      hospitalsList = jsonModels
          .map<HospitalBanks>(
              (_modelJson) => HospitalBanks.fromJson(_modelJson))
          .toList();

      debugPrint('hospitals..... $hospitalsList');
      loadingState = LoadingState.finished;
      notifyListeners();

      return hospitalsList;
    } catch (error) {
      rethrow;
    }
  }
}
