import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'resturant_list/resturant_list.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
      theme: ThemeData(fontFamily: 'Acumin'),
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
      'icon': Icons.favorite_border_outlined,
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
  Future<dynamic> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

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
