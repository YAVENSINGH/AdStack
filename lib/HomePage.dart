import 'package:flutter/material.dart';
import 'package:deskapp/side_bar.dart';
import 'package:deskapp/util/bannerListUno.dart';
import 'package:deskapp/util/bannerTop.dart';
import 'package:deskapp/util/birthday.dart';
import 'package:deskapp/util/calendar_widget.dart';
import 'package:deskapp/util/chart.dart';
import 'package:deskapp/util/top_creators.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      body: Row(
        children: [
          // Left Sidebar
          Sidebar(),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // App Bar like top section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                  ]),
                  child: Row(
                    children: [
                      const Text(
                        "Home",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: Colors.white70),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.event_note_outlined, color: Colors.black54),
                      const SizedBox(width: 16),
                      const Icon(Icons.notifications_none, color: Colors.black54),
                      const SizedBox(width: 16),
                      const Icon(Icons.power_settings_new, color: Colors.black54),
                      const SizedBox(width: 16),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Main scrollable area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Side (Main content)
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const BannerTop(),
                              const SizedBox(height: 20),
                              Row(
                                children: const [
                                  Expanded(child: BannerListUno()),
                                  SizedBox(width: 20),
                                  Expanded(child: TopCreators()),
                                ],
                              ),
                              const SizedBox(height: 20),
                              PerformanceChart(),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Right Side Panel
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1F1D47), // Deep navy background
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header and Calendar
                                const Text(
                                  "GENERAL 10:00 AM TO 7:00 PM",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: AestheticCalendar(), // Your custom calendar widget
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Today Birthday
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF29275A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("✨ Today Birthday", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                          Icon(Icons.star, color: Colors.amber),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: const [
                                         AnniversaryWidget()
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Text("Total 2", style: TextStyle(color: Colors.white70, fontSize: 14)),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFB585F5), // Light purple
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        ),
                                        child: const Text("🎂 Birthday Wishing", style: TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Anniversary
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF29275A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "✨ Anniversary",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(Icons.star, color: Colors.amber),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      AnniversaryWidget(), // Clean replacement
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
