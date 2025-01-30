import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/destination_page.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
import 'package:your_global_trip/tiles/search_tile.dart';
import 'package:your_global_trip/tiles/location_card.dart'; // Import the new component

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var locations = [
      [
        "Hurghada",
        "https://booking.yourglobaltrip.com/images/HRG/2 HRG GIFT.jpg"
      ],
      [
        "Marsa Alam",
        "https://booking.yourglobaltrip.com/images/RMF/28 RMF SATA.jpg"
      ],
      [
        "Sharm Al-Sheikh",
        "https://booking.yourglobaltrip.com/images/SSH/46 SSH CIT2.jpg"
      ],
      ["Aswan", "https://booking.yourglobaltrip.com/images/ASW/80 NUBIAN.jpg"],
      [
        "Cairo",
        "https://booking.yourglobaltrip.com/images/CAI/83 CAI SOPY.jpg"
      ],
      ["Luxor", "https://booking.yourglobaltrip.com/images/LXR/69 WEST1.jpg"],
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  "Choose your distenation",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SearchTile(),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, bottom: 5),
                child: Text(
                  "Recommended trips",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),
              Center(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return LocationCard(
                      locationName: locations[index][0],
                      locationImageUrl: locations[index][1],
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationPage(
                              destinationIndex: index,
                            ),
                          ),
                        )
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
