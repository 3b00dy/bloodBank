import 'package:bankblood/pages/basic_search_page.dart';
import 'package:bankblood/pages/settings.dart';
import 'package:bankblood/pages/donors.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

import 'colors.dart';
import 'i18n/translations.dart';
import 'pages/donation.dart';
import 'provider/volunteer_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  int _currentIndex = 0;
  late PageController _pageController;

  final Color _colors = AppColors().orange;
  final AppColors _color = AppColors();

  @override
  Widget build(BuildContext context) {
    print("building");
    var translation = Translations.of(context);
    final List<Widget> _title = <Widget>[
      Text(translation.home),
      Text(translation.donors),
      Text(translation.donate),
      Text(translation.settings)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color.orange,
        centerTitle: true,
        title: _title[_currentIndex],
        elevation: 0,

      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            BasicSearch(),
            Donors(),
            Donate(),
            const Settings()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Provider.of<AppColors>(context).grey,
        itemCornerRadius: 15,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          if (index == 1) {
            Provider.of<VolunteerProvider>(context, listen: false)
                .fetchVolunteer();
          }
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: _color.deepOrange,
              title: Text(
                translation.home,
                style: TextStyle(color: Provider.of<AppColors>(context).black),
              ),
              icon: Icon(
                FlutterRemix.search_eye_line,
                color: Provider.of<AppColors>(context).black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                translation.donors,
                style: TextStyle(color: Provider.of<AppColors>(context).black),
              ),
              icon: Icon(
                FlutterRemix.empathize_line,
                color: Provider.of<AppColors>(context).black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                translation.donate,
                style: TextStyle(color: Provider.of<AppColors>(context).black),
              ),
              icon: Icon(
                FlutterRemix.heart_add_fill,
                color: Provider.of<AppColors>(context).black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                translation.settings,
                style: TextStyle(color: Provider.of<AppColors>(context).black),
              ),
              icon: Icon(
                FlutterRemix.settings_2_line,
                color: Provider.of<AppColors>(context).black,
              )),
        ],
      ),
    );
  }
}
/*
    */
