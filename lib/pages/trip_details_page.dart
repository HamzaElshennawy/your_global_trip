import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key});

  @override
  _TripDetailsPageState createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  String? _selectedDate;
  String? _selectedIndividuals;
  String? _selectedKids;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        logoEnabled: false,
      ),
      backgroundColor: Colors.grey[100],
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
              children: _buildChoiceChips(
                  ['15/1', '20/1', '30/1'], _selectedDate, (value) {
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
              title: 'Number of Kids',
              delay: 600,
              children: _buildChoiceChips(
                  ['1', '2', '3', '4', '5+'], _selectedKids, (value) {
                setState(() {
                  _selectedKids = value;
                });
              }),
            ),
            const SizedBox(height: 16),
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
  _AnimatedHeaderState createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader>
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
        child: Text(
          "Trip Details",
        ),
      ),
    );
  }
}

class AnimatedSectionCard extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final int delay;

  const AnimatedSectionCard(
      {super.key, required this.title, required this.children, this.delay = 0});

  @override
  _AnimatedSectionCardState createState() => _AnimatedSectionCardState();
}

class _AnimatedSectionCardState extends State<AnimatedSectionCard>
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
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
