import 'package:flutter/material.dart';
import 'package:your_global_trip/pages/trip_details_page.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({super.key});

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  bool wishListed = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void addToWishList() {
    setState(() {
      wishListed = !wishListed;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCard,
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🖼 Image Section
            FadeInImage.assetNetwork(
              image:
                  "https://booking.yourglobaltrip.com/images/CAI/CAI%20MTUL.jpg",
              placeholder: "assets/icon/logo.png",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            /// 📝 Title & Description
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 📌 Title & Bookmark
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full day tour, Old Cairo",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {
                            addToWishList();
                          },
                          icon: wishListed
                              ? Icon(Icons.bookmark)
                              : Icon(Icons.bookmark_border_outlined)),
                    ],
                  ),
                  SizedBox(height: 5),

                  /// 📝 Short Description
                  Text(
                    "Step back in time with a journey through Old Cairo...",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            /// 🌟 Expandable Content (Smooth Animation)
            SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _expandedContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🏛 Expanded Content
  Widget _expandedContent() {
    return Column(
      children: [
        /// 🕒 Time & Details (Split into Two Columns)
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ⏳ Left Column (Time & Transport)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(Icons.schedule, "8 AM - 8 PM"),
                  _infoRow(Icons.directions_bus, "Transportation provided"),
                ],
              ),
            ),

            /// 🍽 Right Column (Food & Map)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(Icons.restaurant, "Lunch included"),
                  _infoRow(Icons.map, "View on maps"),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        /// 🌟 Highlights (Moved to Bottom)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Highlights:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            ...[
              "Visit Ibn Tulun Mosque",
              "Explore Coptic Cairo",
              "Stop by for lunch",
              "Tour The Great Egyptian Museum",
              "Roam in House of Gayer Anderson"
            ].map((highlight) => Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 18, color: Colors.black),
                      SizedBox(width: 5),
                      Flexible(child: Text(highlight)),
                    ],
                  ),
                )),
          ],
        ),

        SizedBox(height: 10),

        /// 💰 Pricing
        Text("Cost / person",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _priceColumn(Icons.person, "Adults", "75€"),
            _priceColumn(Icons.child_care, "Kids", "40€"),
            _priceColumn(Icons.baby_changing_station, "Infants", "Free"),
          ],
        ),
        SizedBox(height: 10),

        /// 🏷 Booking Button
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TripDetailsPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // 🟠 Change to orange
                foregroundColor: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    50), // 📏 80% width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Book Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }

  /// ✅ Small Helper Widgets
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(icon, size: 18),
          SizedBox(width: 5),
          Expanded(
            flex: 1,
            child: Text(
              text,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceColumn(IconData icon, String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Icon(icon),
          Text(label),
          Text(price),
        ],
      ),
    );
  }
}
