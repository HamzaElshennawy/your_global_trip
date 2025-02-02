import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String locationName;
  final String locationImageUrl;
  final VoidCallback onTap;

  const CityCard({
    required this.locationName,
    required this.locationImageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'assets/location.png',
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                locationName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
