import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.groups, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Communities',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Easily organize your related groups and send announcements. Now, your communities, like neighborhoods or schools, can have their own space.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
