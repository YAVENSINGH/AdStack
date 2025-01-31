import 'package:flutter/material.dart';

class CreateHeader extends StatelessWidget {
  const CreateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/female.png'),
          ),
          SizedBox(height: 10.0),
          Text(
            'John Doe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
