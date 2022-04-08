import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../statics.dart';

class Authentication with ChangeNotifier {
  bool isObscure = true;

  eye() {
    isObscure = !isObscure;
    notifyListeners();
  }

  final _controller = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  String? dropdownValue;
  String? genderValue;

  String hint = 'Choose type of blood';
  String? genderHint;
  List items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  setValue(val) {
    dropdownValue = val;
    hint = val;
    notifyListeners();
  }

  setGenderValue(val) {
    genderValue = val;
    genderHint = val;
    notifyListeners();
  }

  signIn(String email, String password) async {
    var url = Uri.parse('$baseUrl/api/account/signin');

    try {
      final res = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
          }));
      statusCode = res.statusCode;
      debugPrint('response code.. $statusCode');

      var responseBody = jsonDecode(res.body)['account'];
      var tokenResponse = jsonDecode(res.body)['token']['access'];

      debugPrint('response Type.. ${responseBody.runtimeType}');
      debugPrint('response body.. $responseBody');
      debugPrint('response code.. $statusCode');

      SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
      tokenValueSet.setString('token', jsonDecode(res.body)['token']['access']);

      debugPrint('response token.. $tokenResponse');

      // userId = responseBody['id'];
    } catch (e) {
      print('error...${e}');
    }
    notifyListeners();
  }

  late int statusCode;

  register(authValues) async {
    http.Response resposne;
    try {
      // loadingState = LoadingState.loading;
      var url = Uri.parse('$baseUrl/api/account/signup');
      resposne = await http.post(url,
          body: jsonEncode({
            "first_name": authValues['first_name'],
            "last_name": authValues['last_name'],
            "email": authValues['email'],
            "password1": authValues['password1'],
            "password2": authValues['password2'],
            "address": authValues['address'],
            "bloodType": authValues['bloodType'],
            "birthdate": authValues['birthdate'],
            "gender": authValues['gender'],
          }));

      debugPrint("ValuesEntry ${authValues['birthdate']}");

      debugPrint("status code ${resposne.statusCode}");
      statusCode = resposne.statusCode;

      var tokenResponse = jsonDecode(resposne.body)['token']['access'];

      SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
      tokenValueSet.setString('token', tokenResponse);

      debugPrint("status code ${resposne.statusCode}");
      debugPrint("status code ${resposne.body}");
    } catch (error) {
      print(error.toString());
    }
    // loadingState = LoadingState.finished;
  }

  logout() async {
    SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
    tokenValueSet.setString('token', 'null');
  }
}
