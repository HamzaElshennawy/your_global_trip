import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Choose Your Destination"),
      body: Container(
        margin: EdgeInsets.all(0),
        child: Center(
          child: const Text("Search Page is here"),
        ),
      ),
    );
  }
}
