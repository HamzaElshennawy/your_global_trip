import 'dart:collection';
import 'package:flutter/material.dart';

class SearchTile extends StatefulWidget {
  const SearchTile({super.key});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

typedef DestinationEntry = DropdownMenuEntry<Destination>;

enum Destination {
  cairo('Cairo'),
  alex('Alex'),
  hurghada('Hurghada'),
  marsaala('Marsa Alam'),
  aswan("Aswan");

  const Destination(this.label);
  final String label;

  static final List<DestinationEntry> entries =
      UnmodifiableListView<DestinationEntry>(
    values.map<DestinationEntry>(
      (Destination state) => DestinationEntry(
        value: state,
        label: state.label,
        enabled: true,
        style: MenuItemButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
    ),
  );
}

class _SearchTileState extends State<SearchTile> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController resortController = TextEditingController();

  Destination? selectedDestination;
  String? selectedResort;

  // Mapping destinations to their available resorts
  final Map<Destination, List<String>> resortsMap = {
    Destination.cairo: ['Hotel 1 in Cairo', 'Hotel 2 in Cairo'],
    Destination.alex: ['Hotel 1 in Alex', 'Hotel 2 in Alex'],
    Destination.hurghada: ['Hotel 1 in Hurghada', 'Hotel 2 in Hurghada'],
    Destination.marsaala: ['Hotel 1 in Marsa Alam', 'Hotel 2 in Marsa Alam'],
    Destination.aswan: ['Hotel 1 in Aswan', 'Hotel 2 in Aswan'],
  };

  List<DropdownMenuEntry<String>> getAvailableResorts() {
    final availableResorts = resortsMap[selectedDestination] ?? [];
    return availableResorts.map((resort) {
      return DropdownMenuEntry(
        value: resort,
        label: resort,
        enabled: true,
        style: MenuItemButton.styleFrom(
          foregroundColor: Colors.black,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            DropdownMenu<Destination>(
              initialSelection: Destination.cairo,
              width: MediaQuery.of(context).size.width - 50,
              controller: destinationController,
              enableFilter: true,
              requestFocusOnTap: true,
              leadingIcon: const Icon(Icons.search),
              label: const Text('State'),
              inputDecorationTheme: const InputDecorationTheme(
                filled: false,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: (Destination? state) {
                setState(() {
                  selectedDestination = state;
                  resortController.clear();
                  selectedResort = null;
                });
              },
              dropdownMenuEntries: Destination.entries,
            ),
            DropdownMenu<String>(
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
              onSelected: (String? resort) {
                setState(() {
                  selectedResort = resort;
                });
              },
              dropdownMenuEntries: getAvailableResorts(),
            ),
          ],
        ),
      ),
    );
  }
}
