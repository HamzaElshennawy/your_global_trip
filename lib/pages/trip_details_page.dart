import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key});

  @override
  TripDetailsPageState createState() => TripDetailsPageState();
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
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ),
  );
}

class TripDetailsPageState extends State<TripDetailsPage> {
  String? _selectedDate;
  String? _selectedIndividuals;
  String? _selectedChilds;
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController personalRequestController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        logoEnabled: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimatedHeader(),
            const SizedBox(height: 24),
            AnimatedSectionCard(
              title: 'Available Dates',
              delay: 200,
              children: _buildChoiceChips([
                '15/1',
                '20/1',
                '30/1',
                '15/1',
              ], _selectedDate, (value) {
                setState(() {
                  _selectedDate = value;
                });
              }),
            ),
            const SizedBox(height: 16),
            AnimatedSectionCard(
              title: 'Number of Individuals',
              delay: 400,
              children: _buildChoiceChips(
                  ['1', '2', '3', '4', '5+'], _selectedIndividuals, (value) {
                setState(() {
                  _selectedIndividuals = value;
                });
              }),
            ),
            const SizedBox(height: 16),
            AnimatedSectionCard(
              title: 'Number of Childs',
              delay: 600,
              children: _buildChoiceChips(
                  ['0', '1', '2', '3', '4', '5+'], _selectedChilds, (value) {
                setState(() {
                  _selectedChilds = value;
                });
              }),
            ),
            AnimatedSectionCard(
              delay: 800,
              backgroundColor: Colors.transparent,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: screenWidth - 40,
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
                  child: DropdownMenu<Destination>(
                    initialSelection: null,
                    width: screenWidth - 40,
                    controller: destinationController,
                    enableFilter: true,
                    requestFocusOnTap: false,
                    trailingIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                    hintText: "Select Hotel/ Pickup",
                    inputDecorationTheme: InputDecorationTheme(
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100]!,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
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
                ),
              ],
            ),
            AnimatedSectionCard(
              title: "Your room number/ personal request",
              titleAlignment: CrossAxisAlignment.start,
              backgroundColor: Colors.transparent,
              delay: 1000,
              padding: EdgeInsets.all(0),
              hasDropShadow: false,
              children: [
                SizedBox(
                  height: 150,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    expands: true, // Expands to fill parent
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ), // Border color when focused
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoiceChips(
      List<String> items, String? selectedValue, Function(String) onSelected) {
    return [
      Wrap(
        spacing: 8.0,
        children: items.map((item) {
          return ChoiceChip(
            selectedColor: Colors.orange,
            backgroundColor: Color(0xFFD9D9D9),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            label: Text(item),
            selected: selectedValue == item,
            onSelected: (bool selected) {
              if (selected) {
                onSelected(item);
              }
            },
          );
        }).toList(),
      ),
    ];
  }
}

class AnimatedHeader extends StatefulWidget {
  const AnimatedHeader({super.key});

  @override
  AnimatedHeaderState createState() => AnimatedHeaderState();
}

class AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuart,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trip Details:",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSectionCard extends StatefulWidget {
  final String? title;
  final List<Widget> children;
  final int delay;
  final Color backgroundColor;
  final CrossAxisAlignment titleAlignment;
  final EdgeInsets padding;
  final bool hasDropShadow;

  const AnimatedSectionCard({
    super.key,
    this.title,
    required this.children,
    this.delay = 0,
    this.backgroundColor = Colors.white,
    this.titleAlignment = CrossAxisAlignment.center,
    this.padding = const EdgeInsets.all(16.0),
    this.hasDropShadow = true,
  });

  @override
  AnimatedSectionCardState createState() => AnimatedSectionCardState();
}

class AnimatedSectionCardState extends State<AnimatedSectionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuart,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: widget.hasDropShadow
                ? const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding:
                widget.title != null ? widget.padding : const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: widget.titleAlignment,
              children: [
                widget.title != null
                    ? Text(
                        widget.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    : SizedBox(),
                widget.title != null ? const SizedBox(height: 12) : SizedBox(),
                Column(
                  children: widget.children,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
