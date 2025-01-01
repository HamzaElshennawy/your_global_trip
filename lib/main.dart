import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ThemeData.dark().canvasColor,
          body: Center(
              child: Text(
            "data",
            style:
                TextStyle(color: ThemeData.dark().colorScheme.inversePrimary),
          )),
        ));
  }
}
