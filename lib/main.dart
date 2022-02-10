import 'package:bankblood/colors.dart';
import 'package:bankblood/pages/hospitals_results.dart';
import 'package:bankblood/pages/search_by_type.dart';
import 'package:bankblood/pages/splash.dart';
import 'package:bankblood/provider/TypeChangeButtonColor.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:bankblood/provider/search_type_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'home.dart';
import 'i18n/translations_delegate.dart';

import 'package:provider/provider.dart';

import 'pages/donation.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'provider/test.dart';

const Locale arLocale = Locale('ar');
const Locale enLocale = Locale('en');

Locale? prevLocale;
String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
  //
  // token = tokenValueSet.getString('token') ?? 'null';
  // debugPrint('token=   ${token}');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (color) => ChangeButtonColor(),
        ),
        ChangeNotifierProvider(
          create: (typeColor) => TypeChangeButtonColor(),
        ),
        ChangeNotifierProvider(
          create: (test) => Auth(),
        ), ChangeNotifierProvider(
          create: (auth) => Authentication(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Locale> get supportedLocales => [
        arLocale,
        enLocale,
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors().orange,
          appBarTheme: AppBarTheme(color: AppColors().orange),
          fontFamily: 'Roboto'),

      initialRoute: '/',

      routes: {
        '/': (context) => const Home(),
        'Splash': (context) => const Splash(),
        'search_compatible': (context) => CompatibleType(),
        'hospitals': (context) => Hospitals(),
        'donate': (context) => Donate(),
        'register': (context) => Register(),
        'login': (context) => Login(),
      },
      localizationsDelegates: const [
        AlphaStoreLocalizationDelegate(),
        TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: enLocale,
    );
  }
}
