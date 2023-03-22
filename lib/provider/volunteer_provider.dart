import 'dart:convert';

import 'package:bankblood/models/dummyData.dart';
import 'package:bankblood/models/hopsital_banks.dart';
import 'package:bankblood/models/volunteers_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../statics.dart';
import 'loading_state.dart';

class VolunteerProvider extends ChangeNotifier {
   LoadingState? loadingState;

  List<Volunteers>? volList;
int defaultLength=0;
  fetchVolunteer() async {
    loadingState = LoadingState.loading;
    http.Response response;

    try {
      var url = Uri.parse('$baseUrl/api/volunteers');
      response = await http.get(url);
      var jsonModels = json.decode(response.body);

      debugPrint('hospitals....$jsonModels');
      volList = jsonModels
          .map<Volunteers>((_modelJson) => Volunteers.fromJson(_modelJson))
          .toList();
defaultLength=volList!.length;
      debugPrint('hospitals..... $volList');
      debugPrint('hospitals length..... ${volList!.length}');

      loadingState = LoadingState.finished;

      notifyListeners();

      return volList;
    } catch (error) {
      // loadingState = LoadingState.idle;
      notifyListeners();

      rethrow;
    }
  }
}
