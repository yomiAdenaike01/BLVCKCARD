import 'package:flutter/material.dart';

import 'resturant_list/resturant_list.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Map<String, dynamic>> bottomNavItemsMap = [
    {
      'icon': Icons.kitchen,
      'label': 'Resturants',
      'widget': ResturantList(),
    },
    {
      'icon': Icons.hearing_outlined,
      'label': 'Saved',
    },
    {
      'icon': Icons.inbox,
      'label': 'Inbox',
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
    }
  ];

  @override
  Widget build(BuildContext context) {
    int cIndex = 0;
    Widget currentComponent = bottomNavItemsMap[cIndex]['widget'];

    return Scaffold(
      body: SafeArea(
        child: currentComponent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cIndex,
        onTap: (int index) {
          setState(() {
            cIndex = index;
          });
        },
        items: [
          ...bottomNavItemsMap.map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e['icon']),
              label: e['label'],
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
