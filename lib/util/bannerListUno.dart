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
      "title": "AI-Based Productivity Tools",
      "image": "images/shapes.png",
    },
    {
      "title": "Next-Gen Mobile App Design",
      "image": "images/shapes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1D47),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Project List
          Column(
            children: projects.map((project) {
              bool isHighlighted = project.containsKey("highlighted");

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isHighlighted
                      ? const Color(0xFF6C5CE7)
                      : const Color(0xFF2C2A5C),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: isHighlighted
                      ? [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                      : [],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        project["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Project Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project["title"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: const [
                              Icon(Icons.folder, size: 12, color: Colors.white54),
                              SizedBox(width: 4),
                              Text(
                                "Project #1",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              // Add onTap navigation
                            },
                            child: const Text(
                              "See project details",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF74B9FF),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Edit Icon
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white38,
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
