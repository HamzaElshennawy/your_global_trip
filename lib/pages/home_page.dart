import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/destination_page.dart';
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "Choose your distenation",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SearchTile(),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, bottom: 5),
                child: Text(
                  "Empower your vacation in two minutes",
                  style: TextStyle(fontSize: 32, color: Colors.orange),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, left: 15),
                child: Text(
                  "High value daily trips in one touch",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w200),
                ),
              ),
              Center(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children:
                      List.generate(locations.length, growable: true, (index) {
                    return GestureDetector(
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
                      child: LocationListTile(
                        locationImageUrl: locations[index][1],
                        locationName: locations[index][0],
                      ),
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
