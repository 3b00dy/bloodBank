import 'dart:async';

import 'package:bankblood/colors.dart';
import 'package:bankblood/pages/hospitals_results.dart';
import 'package:bankblood/pages/search_by_type.dart';
import 'package:bankblood/pages/splash.dart';
import 'package:bankblood/pages/volunteers.dart';
import 'package:bankblood/provider/TypeChangeButtonColor.dart';
import 'package:bankblood/provider/add_volunteer.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:bankblood/provider/connection_state.dart';
import 'package:bankblood/provider/language_viewModel.dart';
import 'package:bankblood/provider/search_type_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:developer' as developer;

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'home.dart';
import 'i18n/translations_delegate.dart';

import 'package:provider/provider.dart';

import 'pages/donation.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'provider/volunteer_provider.dart';

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
          create: (test) => VolunteerProvider(),
        ), ChangeNotifierProvider(
          create: (auth) => Authentication(),
        ),
        ChangeNotifierProvider(
          create: (add) => AddVolunteerProvider(),
        ),   ChangeNotifierProvider(
          create: (color) => AppColors(),
        ),  ChangeNotifierProvider(
          create: (language) => AppViewModel(),
        ), ChangeNotifierProvider(
          create: (connection) => ConnectionStatus(),
        ),
      ],
      child:  Consumer<AppViewModel>(builder: (context, viewModel, child) {

        return MyApp(viewModel.appLocale);
      }),
    ),
  );
}


class MyApp extends StatefulWidget {

  const MyApp(this.currentLocate,{Key? key}) : super(key: key);

  final Locale currentLocate;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Locale> get supportedLocales => [
    enLocale,
    arLocale,

      ];

  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      Provider.of<ConnectionStatus>(context,listen: false).setConnectionState(result.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors().orange,
          appBarTheme: AppBarTheme(color: AppColors().orange),
          fontFamily: widget.currentLocate==arLocale?'Tajawal':'Roboto'),

      initialRoute: '/',

      routes: {
        '/': (context) => const Home(),
        'Splash': (context) => const Splash(),
        'search_compatible': (context) => CompatibleType(),
        'hospitals': (context) => Hospitals(),
        'donate': (context) => Donate(),
        'register': (context) => Register(),
        'login': (context) => Login(),
        'volunteer': (context) => Volunteers(),
      },
      localizationsDelegates: const [
        AlphaStoreLocalizationDelegate(),
        TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: widget.currentLocate,
    );
  }
}
