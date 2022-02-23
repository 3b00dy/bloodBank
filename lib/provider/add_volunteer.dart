// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../statics.dart';

class AddVolunteerProvider with ChangeNotifier {
  bool isSigned = false;

  addVolunteer(volunteerInformation) async {
    var url = Uri.parse('$baseUrl/api/volunteer');

    try {
      final res = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            'volunteerName': volunteerInformation['volunteerName'],
            'volunteerAge': volunteerInformation['volunteerAge'],
            'volunteerAddress': volunteerInformation['volunteerAddress'],
            'volunteerBloodType': volunteerInformation['volunteerBloodType'],
            'volunteerPhoneNumber': volunteerInformation['volunteerPhoneNumber']
          }));

      print(res.statusCode);
      var responseBody = jsonDecode(res.body);

      if (res.statusCode == 201) {
        isSigned = true;
      }
      debugPrint('response Type.. ${responseBody.runtimeType}');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
