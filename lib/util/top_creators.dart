import 'package:flutter/material.dart';

class TopCreators extends StatelessWidget {
  const TopCreators({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for creators
    List<Map<String, dynamic>> creators = [
      {"name": "@maddison_c21", "artworks": 9821, "rating": 0.9, "image": "images/snap1.png"},
      {"name": "@karl.will02", "artworks": 7032, "rating": 0.7, "image": "images/snap2.png"},
      {"name": "@maddison_c21", "artworks": 9821, "rating": 0.9, "image": "images/snap3.png"},
      {"name": "@maddison_c21", "artworks": 9821, "rating": 0.9, "image": "images/snap1.png"},
    ];

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF12163A), // Dark blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Top Creators",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          // Table Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text("Name", style: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              Expanded(
                flex: 3,
                child: Text("Artworks", style: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              Expanded(
                flex: 3,
                child: Text("Rating", style: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
            ],
          ),
          Divider(color: Colors.grey),

          // List of Creators
          Column(
            children: creators.map((creator) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Image and Name
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(creator["image"]),
                          ),
                          SizedBox(width: 10),
                          Text(
                            creator["name"],
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    // Artworks Count
                    Expanded(
                      flex: 3,
                      child: Text(
                        creator["artworks"].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),

                    // Rating Progress Bar
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        value: creator["rating"],
                        backgroundColor: Colors.grey.shade800,
                        color: Colors.purpleAccent,
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
