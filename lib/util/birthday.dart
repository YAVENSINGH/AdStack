import 'package:flutter/material.dart';

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF292A4E), // Dark purple background
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "✨ Today Birthday ✨",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAvatar('images/snap1.png'), // Replace with actual image path
              SizedBox(width: 8.0),
              _buildAvatar('images/snap2.png'), // Replace with actual image path
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(width: 8.0),
              Text(
                "2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9B7CF6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              // Action for wishing birthday
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.send, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  "Birthday Wishing",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imagePath) {
    return CircleAvatar(
      radius: 24.0,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
