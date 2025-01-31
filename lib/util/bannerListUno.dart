import 'package:flutter/material.dart';

class BannerListUno extends StatefulWidget {
  const BannerListUno({super.key});

  @override
  State<BannerListUno> createState() => _BannerListUnoState();
}

class _BannerListUnoState extends State<BannerListUno> {
  final List<Map<String, String>> projects = [
    {
      "title": "Technology behind the Blockchain",
      "image": "images/shapes.png",
      "highlighted": "true",
    },
    {
      "title": "Technology behind the Blockchain",
      "image": "images/shapes.png",
    },
    {
      "title": "Technology behind the Blockchain",
      "image": "images/shapes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),

          // Project List
          Column(
            children: projects.map((project) {
              bool isHighlighted = project.containsKey("highlighted");

              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHighlighted ? Colors.redAccent : Colors.blueGrey.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Project Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        project["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),

                    // Project Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project["title"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Project #1  •  ",
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "See project details",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Edit Icon
                    Icon(
                      Icons.edit,
                      color: Colors.white60,
                      size: 18,
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
