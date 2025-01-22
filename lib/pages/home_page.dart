import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
import 'package:your_global_trip/tiles/location_list_tile.dart';
import 'package:your_global_trip/tiles/search_tile.dart';

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
              Text(
                "Choose your distenation",
                style: TextStyle(fontSize: 28),
              ),
              SearchTile(),
              Center(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children:
                      List.generate(locations.length, growable: true, (index) {
                    return LocationListTile(
                      locationImageUrl: locations[index][1],
                      locationName: locations[index][0],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
