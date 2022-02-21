import 'package:bankblood/pages/basic_search_page.dart';
import 'package:bankblood/pages/volunteers.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

import 'colors.dart';
import 'pages/donation.dart';
import 'provider/volunteer_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  final List<Widget> _title = <Widget>[const Text('Home'), const Text('Volunteers'), const Text('Donate'), const Text('Setting')];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final Color _colors = AppColors().orange;
  final AppColors _color = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color.orange,
        centerTitle: true,
        title:  _title[_currentIndex],
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
           Volunteers(),
            Donate(),
            Container(
              color: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: _color.grey,
        itemCornerRadius: 15,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          if(index==1){
            Provider.of<VolunteerProvider>(context, listen: false).fetchVolunteer();

          }
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: _color.deepOrange,
              title: Text(
                'Home',
                style: TextStyle(color: _color.black),
              ),
              icon: Icon(
                FlutterRemix.search_eye_line,
                color: _color.black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                'Volunteers',
                style: TextStyle(color: _color.black),
              ),
              icon: Icon(
                FlutterRemix.empathize_line,
                color: _color.black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                'Donate',
                style: TextStyle(color: _color.black),
              ),
              icon: Icon(
                FlutterRemix.heart_add_fill,
                color: _color.black,
              )),
          BottomNavyBarItem(
              activeColor: _colors,
              title: Text(
                'settings',
                style: TextStyle(color: _color.black),
              ),
              icon: Icon(
                FlutterRemix.settings_2_line,
                color: _color.black,
              )),
        ],
      ),
    );
  }
}
/*
    */
