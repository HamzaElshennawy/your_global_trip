import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/conditions_page.dart';
import 'package:your_global_trip/pages/home_page.dart';
import 'package:your_global_trip/pages/search_page.dart';
import 'package:your_global_trip/providers/app_bar_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [
    const HomePage(),
    const SearchPage(),
    const ConditionsPage(),
  ];
  var _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 30,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              activeIcon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
                activeIcon: Icon(Icons.person_2)),
          ],
          onTap: (index) => {
            setState(() {
              _selectedPageIndex = index;
            }),
          },
        ),
        body: pages[_selectedPageIndex],
      ),
      theme: AppTheme.appBarThemeDataLight,
    );
  }
}
