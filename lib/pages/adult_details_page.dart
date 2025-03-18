import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
import 'package:your_global_trip/tiles/user_form.dart';

class AdultDetailsPage extends StatefulWidget {
  const AdultDetailsPage({super.key});

  @override
  State<AdultDetailsPage> createState() => _AdultDetailsPageState();
}

class _AdultDetailsPageState extends State<AdultDetailsPage> {
  // This page will be changed to [listview.builder]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        logoEnabled: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adult 1:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            UserForm(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Adult 1:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            UserForm(),
          ],
        ),
      ),
    );
  }
}
