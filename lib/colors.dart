import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColors extends ChangeNotifier {
  bool isDark = false;

  // bool isLight = true;
  Color orange = const Color(0xffFF432A);
  Color deepOrange = const Color(0xffff0000);
  Color grey = const Color(0xffC4C4C4);
  Color pink = const Color(0xffDEC4C4);
  Color white = const Color(0xffffffff);
  Color black = const Color(0xff000000);
  Color greys = const Color(0xffE8E8E8);
  Color blue = const Color(0xff3E30DD);
  Color hint = const Color(0xff727272);
darkSelected(){
  white = const Color(0xff000000);
  black = const Color(0xffffffff);
  grey = const Color(0xff2d2c2c);
  greys = const Color(0xff979696);
notifyListeners();
}
lighSelected(){
  white = const Color(0xffffffff);
  black = const Color(0xff000000);
  grey = const Color(0xffE8E8E8);
  greys = const Color(0xffE8E8E8);
}
  darkMode(bool isLight) async {
    if (isLight) {
      white = const Color(0xff000000);
      black = const Color(0xffffffff);
      grey = const Color(0xff2d2c2c);
      greys = const Color(0xff979696);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('dark', true);
      isDark = prefs.getBool('dark')!;

      notifyListeners();
    } else {
      white = const Color(0xffffffff);
      black = const Color(0xff000000);
      grey = const Color(0xffE8E8E8);
      greys = const Color(0xffE8E8E8);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('dark', false);
      isDark = prefs.getBool('dark')!;
      notifyListeners();
    }
  }
// lightMode() {
//   white = const Color(0xffffffff);
//   black = const Color(0xff000000);
//   notifyListeners();
// }
}

//  Color orange = const Color(0xffFF432A);
//   Color deepOrange = const Color(0xffff0000);