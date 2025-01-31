import 'package:flutter/material.dart';

class AnniversaryWidget extends StatelessWidget {
  const AnniversaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1A39),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("✨", style: TextStyle(fontSize: 18)),
              SizedBox(width: 6),
              Text(
                "Anniversary",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Text("✨", style: TextStyle(fontSize: 18)),
            ],
          ),

          const SizedBox(height: 14),

          // Avatars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAvatar("images/snap1.png"),
              const SizedBox(width: 8),
              _buildAvatar("images/snap2.png"),
              const SizedBox(width: 8),
              _buildAvatar("images/snap3.png"),
            ],
          ),

          const SizedBox(height: 16),

          // Total Count
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Total", style: TextStyle(color: Colors.white70)),
              SizedBox(width: 6),
              Text("|", style: TextStyle(color: Colors.grey)),
              SizedBox(width: 6),
              Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9B5DE5),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(width: 8),
                const Text(
                  "Anniversary Wishing",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildAvatar(String path) {
    return CircleAvatar(
      radius: 18,
      backgroundImage: AssetImage(path),
    );
  }
}
