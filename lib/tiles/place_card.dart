import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/trip_details_page.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white70),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            image:
                "https://booking.yourglobaltrip.com/images/CAI/CAI%20MTUL.jpg",
            placeholder: "assets/icon/logo.png",
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageErrorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container(
                padding: EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Unable to connect to server. Please try again.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Icon(
                      Icons.portable_wifi_off,
                      size: 28,
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Full day tour, Old Cairo",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border,
                    )
                  ],
                ),
                Text(
                  "Step back in time with a journey through Old Cairo, wander its narrow, history-soaked streets, marvel at stunning ancient architecture, and immerse yourself in the rich tapestry of culture, heritage, and timeless stories waiting to be discovered.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "More Details",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
