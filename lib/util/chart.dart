import 'package:flutter/material.dart';

class PerformanceChart extends StatelessWidget {
  final List<PerformanceData> data = [
    PerformanceData(year: 2015, pending: 2, project: 3, done: 4, cancelled: 1),
    PerformanceData(year: 2016, pending: 3, project: 2, done: 5, cancelled: 0),
    PerformanceData(year: 2017, pending: 1, project: 4, done: 3, cancelled: 2),
    PerformanceData(year: 2018, pending: 2, project: 3, done: 5, cancelled: 0),
    PerformanceData(year: 2019, pending: 0, project: 5, done: 4, cancelled: 1),
    PerformanceData(year: 2020, pending: 1, project: 2, done: 6, cancelled: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // Add a sleek background color
      decoration: BoxDecoration(
        color: Color(0xFF1e1e2f),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Overall Performance',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontFamily: 'RobotoMono',
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Yearly Breakdown',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white38,
              fontFamily: 'RobotoMono',
            ),
          ),
          SizedBox(height: 24),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegendItem('Pending', Color(0xFFFFA726)),
              _buildLegendItem('Project', Color(0xFF26C6DA)),
              _buildLegendItem('Done', Color(0xFF66BB6A)),
              _buildLegendItem('Cancelled', Color(0xFFEF5350)),
            ],
          ),
          SizedBox(height: 16),

          // Chart Bars
          SizedBox(
            height: 300, // Adjusted height for better visibility
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _buildYearBar(data[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: Colors.white60,
            fontFamily: 'RobotoMono',
          ),
        ),
      ],
    );
  }

  Widget _buildYearBar(PerformanceData performance) {
    int total = performance.total;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Year Label
          Text(
            performance.year.toString(),
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
          ),
          SizedBox(height: 8),
          // Bar Representation
          Stack(
            children: [
              Container(
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                children: [
                  _buildSegment(
                    flex: performance.pending,
                    color: Color(0xFFFFA726),
                    total: total,
                  ),
                  _buildSegment(
                    flex: performance.project,
                    color: Color(0xFF26C6DA),
                    total: total,
                  ),
                  _buildSegment(
                    flex: performance.done,
                    color: Color(0xFF66BB6A),
                    total: total,
                  ),
                  _buildSegment(
                    flex: performance.cancelled,
                    color: Color(0xFFEF5350),
                    total: total,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSegment({required int flex, required Color color, required int total}) {
    double percentage = (flex / total) * 100;
    return Expanded(
      flex: flex,
      child: Container(
        height: 24,
        decoration: BoxDecoration(
          // Use gradient for a futuristic look
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.8),
              color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Tooltip(
          message: '${percentage.toStringAsFixed(1)}%',
          child: SizedBox(),
        ),
      ),
    );
  }
}

class PerformanceData {
  final int year;
  final int pending;
  final int project;
  final int done;
  final int cancelled;

  PerformanceData({
    required this.year,
    required this.pending,
    required this.project,
    required this.done,
    required this.cancelled,
  });

  int get total => pending + project + done + cancelled;
}
