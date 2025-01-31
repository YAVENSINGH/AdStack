import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AestheticCalendar extends StatefulWidget {
  @override
  _AestheticCalendarState createState() => _AestheticCalendarState();
}

class _AestheticCalendarState extends State<AestheticCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2A2A72), Color(0xFF009FFD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: Offset(4, 6),
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          rightChevronIcon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.deepOrange],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.6),
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.pinkAccent.shade200,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(0.4),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          defaultTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          weekendTextStyle: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
          outsideDaysVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          weekendStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
