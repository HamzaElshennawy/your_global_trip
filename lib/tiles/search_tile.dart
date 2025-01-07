import 'dart:collection';

import 'package:flutter/material.dart';

class SearchTile extends StatefulWidget {
  const SearchTile({super.key});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

typedef DestinationEntry = DropdownMenuEntry<Destination>;

enum Destination {
  cairo('Cairo', "Cairo"),
  alex('Alex', "Alex"),
  hurghada('Hurghada', "Hurghada"),
  marsaala('Marsa Alam', 'Marsa Alam'),
  aswan("Aswan", "Aswan");

  const Destination(this.label, this.resort);
  final String label;
  final String resort;

  static final List<DestinationEntry> entries =
      UnmodifiableListView<DestinationEntry>(
    values.map<DestinationEntry>(
      (Destination state) => DestinationEntry(
        value: state,
        label: state.label,
      ),
    ),
  );
}

class _SearchTileState extends State<SearchTile> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController resortController = TextEditingController();
  Destination? selectedDistenation;
  Destination? selectedResort;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            DropdownMenu<Destination>(
              width: MediaQuery.of(context).size.width - 50,
              controller: destinationController,
              enableFilter: true,
              requestFocusOnTap: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('State'),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: (Destination? state) {
                setState(() {
                  selectedDistenation = state;
                });
              },
              dropdownMenuEntries: Destination.entries,
            ),
            DropdownMenu<Destination>(
              width: MediaQuery.of(context).size.width - 50,
              controller: resortController,
              enableFilter: true,
              requestFocusOnTap: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('Resort'),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: (Destination? state) {
                setState(() {
                  selectedResort = state;
                });
              },
              dropdownMenuEntries: Destination.entries,
            ),
          ],
        ),
      ),
    );
  }
}
