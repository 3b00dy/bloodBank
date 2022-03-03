// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../main.dart';

class AppViewModel extends ChangeNotifier {
bool isExpanded=false;
bool? arabic,english;
  Locale appLocale = enLocale;
  AppViewModel() {

  }
expantion(){
    if(isExpanded==true){
      isExpanded=false;
      notifyListeners();
    }else {
      isExpanded = true;
      notifyListeners();
    }
  }

  void switchLanguage() {
    if (appLocale == arLocale) {
      appLocale = enLocale;
      english=true;

    } else {
      appLocale = arLocale;
      arabic=true;
    }

    notifyListeners();
  }

}
