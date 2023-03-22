// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AppViewModel extends ChangeNotifier {
  bool isExpanded = false;
  bool? arabic, english;
  late Locale appLocale=enLocale ;



  expantion() {
    if (isExpanded == true) {
      isExpanded = false;
      notifyListeners();
    } else {
      isExpanded = true;
      notifyListeners();
    }
  }
void setLanguage(locale)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('locale', '$locale');
  debugPrint('locale selected   $locale');
   debugPrint('locale selected   ${prefs.getString('locale')}') ;

  prefs.getString('locale')=='ar'?appLocale=arLocale:appLocale=enLocale;
    notifyListeners();
}



  void switchLanguage() async{


    if (appLocale == arLocale) {
      appLocale = enLocale;
      english = true;

    } else {
      appLocale = arLocale;
      arabic = true;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', '$appLocale');


    notifyListeners();
  }
}
