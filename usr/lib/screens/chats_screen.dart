import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for chat list
    final List<Map<String, String>> chats = [
      {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '10:30 AM', 'avatar': 'JD'},
      {'name': 'Jane Smith', 'message': 'See you tomorrow!', 'time': '9:45 AM', 'avatar': 'JS'},
      {'name': 'Flutter Devs', 'message': 'Alex: Great idea!', 'time': 'Yesterday', 'avatar': 'FD'},
      {'name': 'Mom', 'message': 'Don\'t forget to call.', 'time': 'Yesterday', 'avatar': 'M'},
      {'name': 'Project Group', 'message': 'You: I will send the file.', 'time': '1/15/24', 'avatar': 'PG'},
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Text(chat['avatar']!, style: const TextStyle(color: Colors.white)),
              ),
              title: Text(chat['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(chat['message']!),
              trailing: Text(chat['time']!),
              onTap: () {
                // Navigate to chat screen
              },
            ),
            const Divider(height: 1.0),
          ],
        );
      },
    );
  }
}
