import 'dart:async';

import '/i18n/translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/widgets.dart';



class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(
        Translations(locale.languageCode)
    );
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}


class AlphaStoreLocalizationDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const AlphaStoreLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<MyDefaultCupertinoLocalizations>(
        MyDefaultCupertinoLocalizations(locale.languageCode)
    );
  }

  @override
  bool shouldReload(AlphaStoreLocalizationDelegate old) => false;
}