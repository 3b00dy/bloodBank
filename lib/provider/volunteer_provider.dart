import 'dart:convert';

import 'package:bankblood/models/dummyData.dart';
import 'package:bankblood/models/hopsital_banks.dart';
import 'package:bankblood/models/volunteers_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../statics.dart';



class VolunteerProvider extends ChangeNotifier {


  late List<Volunteers> volList = [];
  fetchVolunteer() async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/volunteers');
      response = await http.get(url);
      var jsonModels = json.decode(response.body);
      debugPrint('hospitals....$jsonModels');
      volList = jsonModels
          .map<Volunteers>(
              (_modelJson) => Volunteers.fromJson(_modelJson))
          .toList();


      debugPrint('hospitals..... $volList');


      notifyListeners();

      return volList;
    } catch (error) {
      rethrow;
    }
  }
}

