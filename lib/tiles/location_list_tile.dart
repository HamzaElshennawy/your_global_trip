import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  final String locationImageUrl;
  final String locationName;

  const LocationListTile(
      {super.key, required this.locationImageUrl, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              locationImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              locationName,
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}
