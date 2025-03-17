import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';
import 'package:your_global_trip/tiles/location_card.dart'; // Import the new component
import 'package:your_global_trip/pages/destination_page.dart';
import 'package:your_global_trip/tiles/search_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  var locations = [
    [
      "Hurghada",
      "https://booking.yourglobaltrip.com/images/HRG/2 HRG GIFT.jpg",
      "Get to know the city and its areas. Dinner is included."
    ],
    [
      "Marsa Alam",
      "https://booking.yourglobaltrip.com/images/RMF/28 RMF SATA.jpg",
      "Experience the local atmosphere in one of the oldest Red Sea towns. The town was part of the old pilgrim route to Mecca."
    ],
    [
      "Sharm Al-Sheikh",
      "https://booking.yourglobaltrip.com/images/SSH/46 SSH CIT2.jpg",
      "Get to know the city and its areas. Your guide will show you places of interest and landmarks in Sharm."
    ],
    [
      "Aswan",
      "https://booking.yourglobaltrip.com/images/ASW/80 NUBIAN.jpg",
      "A half-day visit in Aswan to the Philae Temple, the High Dam and the unfinished obelisk at the granite quarry."
    ],
    [
      "Cairo",
      "https://booking.yourglobaltrip.com/images/CAI/83 CAI SOPY.jpg",
      "Evening tour to the Sound & Light show by the Pyramids of Giza including transport, and entry fees."
    ],
    [
      "Luxor",
      "https://booking.yourglobaltrip.com/images/LXR/69 WEST1.jpg",
      "Float in a hot air balloon over the Nile and the west bank of Luxor at sunrise."
    ],
  ];

  bool isListEnabled = false;
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800), // Slightly longer for smoothness
      vsync: this,
    );

    // Create staggered animations with better easing and delay
    _animations = List.generate(
      locations.length,
      (index) => Tween<Offset>(
        begin: Offset(-1.2, 0), // More to the left for a stronger effect
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.15, // More spacing for a smoother staggered effect
            1.0,
            curve: Curves.fastOutSlowIn, // Faster start, slower end
          ),
        ),
      ),
    );
  }

  void handleSearchTapped() {
    setState(() {
      isListEnabled = true;
    });
    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(logoEnabled: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTile(
              onSearchPressed: () {
                handleSearchTapped();
              },
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.grey.shade300,
              thickness: 2,
            ),
            SizedBox(
              child: Center(
                child: isListEnabled
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          return SlideTransition(
                            position: _animations[index],
                            child: LocationCard(
                              locationName: locations[index][0],
                              locationImageUrl: locations[index][1],
                              locationDescription: locations[index][2],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DestinationPage(
                                        destinationIndex: index),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          Image.asset(
                            "assets/searchpageillus.png",
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Explore, Compare, Find",
                            style: TextStyle(fontSize: 26),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
