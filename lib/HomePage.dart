import 'package:deskapp/side_bar.dart';
import 'package:deskapp/util/bannerListUno.dart';
import 'package:deskapp/util/bannerTop.dart';
import 'package:deskapp/util/birthday.dart';
import 'package:deskapp/util/calendar_widget.dart';
import 'package:deskapp/util/chart.dart';
import 'package:deskapp/util/top_creators.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.event_note_outlined, color: Colors.black87), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.black87), onPressed: () {}),
          IconButton(icon: Icon(Icons.power_settings_new, color: Colors.black87), onPressed: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.black87),
            ),
          ),
        ],
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            bool isDesktop = screenWidth >= 1200;
            bool isTablet = screenWidth >= 600 && screenWidth < 1200;
            bool isMobile = screenWidth < 600;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerTop(),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isDesktop ? 2 : 3,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: BannerListUno()),
                              SizedBox(width: 16),
                              Expanded(flex: 1, child: TopCreators()),
                            ],
                          ),
                          SizedBox(height: 16),
                          PerformanceChart(),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [

                          // BIRTHDAY SECTION
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "🎉 Today Birthday 🎉",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AestheticCalendar(),
                                SizedBox(height: 16),
                                SizedBox(height: 10),
                                BirthdayWidget(),
                                SizedBox(height: 10),
                                BirthdayWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
