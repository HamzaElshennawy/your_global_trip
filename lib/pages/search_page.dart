import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/search_resualts_tile.dart';
import 'package:your_global_trip/tiles/search_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchResults = [
    "test1",
    "test2",
    "test4",
    "test5",
    "test6",
    "test7",
    "test8",
    "test9",
    "test10",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/planelogo.png",
            width: 150,
            height: 150,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Your Global Trip",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: 800,
        margin: EdgeInsets.all(0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SearchTile(),
          Divider(
            indent: 25,
            endIndent: 25,
            color: Colors.grey.shade300,
            thickness: 2,
          ),
          SearchResualtsTile(
            title: "test1",
            description: "test description1",
          ),
          SearchResualtsTile(
            title: "test1",
            description: "test description1",
          ),
        ]),
      ),
    );
  }
}
