import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/destination_page.dart';
import 'package:your_global_trip/tiles/city_card.dart';
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
        "https://booking.yourglobaltrip.com/images/HRG/2 HRG GIFT.jpg",
        "Get to know the city and its areas. Dinner is included.",
      ],
      [
        "Marsa Alam",
        "https://booking.yourglobaltrip.com/images/RMF/28 RMF SATA.jpg",
        "Experience the local atmosphere in one of the oldest Red Sea towns. The town was part of the old pilgrim route to Mecca.",
      ],
      [
        "Sharm Al-Sheikh",
        "https://booking.yourglobaltrip.com/images/SSH/46 SSH CIT2.jpg",
        "Get to know the city and its areas. Your guide will show you places of interest and landmarks in Sharm.",
      ],
      [
        "Aswan",
        "https://booking.yourglobaltrip.com/images/ASW/80 NUBIAN.jpg",
        "A half-day visit in Aswan to the Philae Temple, the High Dam and the unfinished obelisk at the granite quarry. ",
      ],
      [
        "Cairo",
        "https://booking.yourglobaltrip.com/images/CAI/83 CAI SOPY.jpg",
        "Evening tour to the Sound & Light show by the Pyramids of Giza including transport, and entry fees.",
      ],
      [
        "Luxor",
        "https://booking.yourglobaltrip.com/images/LXR/69 WEST1.jpg",
        "Float in a hot air balloon over the Nile and the west bank of Luxor at sunrise.",
      ],
      [
        "Luxor",
        "https://booking.yourglobaltrip.com/images/LXR/69 WEST1.jpg",
        "Float in a hot air balloon over the Nile and the west bank of Luxor at sunrise.",
      ],
    ];
    return Scaffold(
      appBar: CustomAppBar(
        logoEnabled: true,
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
              SearchTile(
                onSearchPressed: () {},
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, bottom: 5),
                child: Text(
                  "Available Destinations",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return CityCard(
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
              ),
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
                      locationDescription: locations[index][2],
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
