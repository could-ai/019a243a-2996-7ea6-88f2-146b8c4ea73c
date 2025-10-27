import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildStatusItem(context, 'My status', 'Tap to add status update', isMyStatus: true),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Recent updates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        _buildStatusItem(context, 'John Doe', 'Today, 10:35 AM'),
        _buildStatusItem(context, 'Jane Smith', 'Today, 9:50 AM'),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Viewed updates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        _buildStatusItem(context, 'Flutter Devs', 'Yesterday, 8:30 PM', isViewed: true),
      ],
    );
  }

  Widget _buildStatusItem(BuildContext context, String title, String subtitle, {bool isMyStatus = false, bool isViewed = false}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: isViewed ? Colors.grey : Theme.of(context).colorScheme.secondary,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: isMyStatus
              ? const Icon(Icons.add, size: 30)
              : const Icon(Icons.person, size: 30), // Placeholder for status thumbnail
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      onTap: () {
        // View status
      },
    );
  }
}
