import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for call log
    final List<Map<String, dynamic>> calls = [
      {'name': 'John Doe', 'time': 'Today, 10:40 AM', 'type': 'incoming', 'isVideo': false},
      {'name': 'Jane Smith', 'time': 'Today, 9:55 AM', 'type': 'outgoing', 'isVideo': true},
      {'name': 'John Doe', 'time': 'Yesterday, 8:00 PM', 'type': 'missed', 'isVideo': false},
    ];

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        IconData callTypeIcon;
        Color callTypeColor;

        switch (call['type']) {
          case 'incoming':
            callTypeIcon = Icons.call_received;
            callTypeColor = Colors.green;
            break;
          case 'outgoing':
            callTypeIcon = Icons.call_made;
            callTypeColor = Colors.green;
            break;
          case 'missed':
          default:
            callTypeIcon = Icons.call_missed;
            callTypeColor = Colors.red;
            break;
        }

        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(call['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: <Widget>[
              Icon(callTypeIcon, color: callTypeColor, size: 16),
              const SizedBox(width: 5),
              Text(call['time']),
            ],
          ),
          trailing: Icon(call['isVideo'] ? Icons.videocam : Icons.call),
          onTap: () {
            // Call contact
          },
        );
      },
    );
  }
}
