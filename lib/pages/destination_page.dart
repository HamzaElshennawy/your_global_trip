import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
import 'package:your_global_trip/tiles/place_card.dart';

class DestinationPage extends StatelessWidget {
  final int destinationIndex;
  const DestinationPage({super.key, required this.destinationIndex});

  @override
  Widget build(BuildContext context) {
    var locations = [
      [
        "Hurghada",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/HRG/2 HRG GIFT.jpg",
      ],
      [
        "Marsa Alam",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/RMF/28 RMF SATA.jpg"
      ],
      [
        "Sharm Al-Sheikh",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/SSH/46 SSH CIT2.jpg"
      ],
      [
        "Aswan",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/ASW/80 NUBIAN.jpg",
      ],
      [
        "Cairo",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/CAI/83 CAI SOPY.jpg"
      ],
      [
        "Luxor",
        "Experience the timeless magic of Cairo where ancient wonders meet vibrant modern life!",
        "Full day boat trip to Giftun Island with fantastic snorkelling options and an intro dive from the boat. Lunch, soft drinks and snorkelling and dive equipment are included.",
        "https://booking.yourglobaltrip.com/images/LXR/69 WEST1.jpg",
      ],
    ];

    return Scaffold(
      appBar: CustomAppBar(
        logoEnabled: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locations[destinationIndex][0],
                style: TextStyle(fontSize: 28),
              ),
              Text(
                locations[destinationIndex][1],
                style: TextStyle(fontSize: 18),
              ),
              PlaceCard(),
              PlaceCard(),
              PlaceCard(),
              PlaceCard(),
              PlaceCard(),
            ],
          ),
        ),
      ),
    );
  }
}
