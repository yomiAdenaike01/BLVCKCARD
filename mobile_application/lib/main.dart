import 'package:flutter/material.dart';
import 'package:mobile_application/screens/invite/invite.dart';
import 'package:mobile_application/screens/profile/profile.dart';
import 'package:mobile_application/screens/saved/saved.dart';
import 'package:location/location.dart';
import 'package:mobile_application/utils/constants.dart';
import './screens/directory/directory.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
      theme: ThemeData.dark().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: const TextStyle(
            height: kLineHeight,
          ),
          bodyText2: const TextStyle(
            height: kLineHeight,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kDeepBlack,
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.white.withOpacity(.7),
          selectedIconTheme: IconThemeData(color: Colors.white),
          showUnselectedLabels: true,
        ),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final Location location = Location();
  List<Map<String, dynamic>> _bottomNavItemsMap = [
    {
      'icon': Icons.restaurant,
      'label': 'Resturants',
      'widget': ResturantDirectory(),
    },
    {
      'icon': Icons.favorite_border_outlined,
      'label': 'Saved',
      'widget': Saved()
    },
    {
      'icon': Icons.inbox,
      'label': 'Invite',
      'widget': Invite(),
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'widget': Profile(),
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    Widget _currentScreen = _bottomNavItemsMap[_currentIndex]['widget'];

    return Scaffold(
      body: SafeArea(
        child: _currentScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          ..._bottomNavItemsMap.map(
            (e) => BottomNavigationBarItem(
              icon: Icon(
                e['icon'],
              ),
              label: e['label'],
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
