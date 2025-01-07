import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
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
        title: "Your Global Trip",
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
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: GridView.count(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(locations.length, (index) {
                      return Center(
                          child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Image.network(
                            height: double.infinity,
                            width: double.infinity,
                            locations[index][1],
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: Text(
                              locations[index][0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ]),
                      ));
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
