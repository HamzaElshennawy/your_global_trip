import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatefulWidget {
  final VoidCallback onSearchPressed;
  const SearchTile({required this.onSearchPressed, super.key});

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
          foregroundColor: Colors.black,
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: screenWidth - 40,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DropdownMenu<Destination>(
              initialSelection: null,
              width: screenWidth - 80,
              controller: destinationController,
              enableFilter: true,
              requestFocusOnTap: false,
              trailingIcon: const Icon(Icons.location_on),
              label: const Text(
                'Select Destination',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey[100]!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
              onSelected: (Destination? state) {
                setState(() {
                  selectedDestination = state;
                  resortController.clear();
                  selectedResort = null;
                });
              },
              dropdownMenuEntries: Destination.entries,
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                elevation: WidgetStatePropertyAll(8),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownMenu<String>(
              width: screenWidth - 80,
              controller: resortController,
              enableFilter: true,
              requestFocusOnTap: false,
              trailingIcon: const Icon(Icons.hotel),
              label: const Text(
                'Select Resort',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey[100]!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
              onSelected: (String? resort) {
                setState(() {
                  selectedResort = resort;
                });
              },
              dropdownMenuEntries:
                  selectedDestination != null ? getAvailableResorts() : [],
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                elevation: WidgetStatePropertyAll(8),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
              enabled: selectedDestination?.index !=
                  null, // Disable if no destination
            ),
            //const SizedBox(height: 30),
            //DatePickerDialog(
            //    firstDate: DateTime.now(), lastDate: DateTime(2026)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                onPressed:
                    (selectedDestination != null && selectedResort != null)
                        ? () {
                            widget.onSearchPressed();
                            if (kDebugMode) {
                              print("pressed");
                            }
                          }
                        : null, // Disable button if no destination is selected

                child: const Text(
                  'Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
