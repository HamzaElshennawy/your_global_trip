import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/conditions_page.dart';
import 'package:your_global_trip/pages/home_page.dart';
import 'package:your_global_trip/providers/app_bar_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [const HomePage(), const ConditionsPage()];
  var _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
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
