import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String locationName;
  final String locationImageUrl;
  final String locationDescription;
  final VoidCallback onTap;

  const LocationCard({
    required this.locationName,
    required this.locationImageUrl,
    required this.locationDescription,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: MediaQuery.of(context).size.width - 50,
        height: 300,
        child: Card(
          child: Column(
            children: [
              Image.network(
                locationImageUrl,
                width: MediaQuery.of(context).size.width - 50,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 200,
                    color: Colors.grey,
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  locationName,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  locationDescription,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
