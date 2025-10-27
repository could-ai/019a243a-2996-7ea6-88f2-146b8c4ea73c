import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/calls_screen.dart';
import 'package:couldai_user_app/screens/chats_screen.dart';
import 'package:couldai_user_app/screens/status_screen.dart';
import 'package:couldai_user_app/screens/community_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GB WhatsApp'),
        elevation: 0.7,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selection
            },
            itemBuilder: (BuildContext context) {
              return {
                'New group',
                'New broadcast',
                'Linked devices',
                'Starred messages',
                'Settings'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.groups)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          CommunityScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  Widget? _buildFab() {
    switch (_currentIndex) {
      case 1: // Chats
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.message, color: Colors.white),
        );
      case 2: // Status
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              mini: true,
              onPressed: () {},
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.edit, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.camera_alt, color: Colors.white),
            ),
          ],
        );
      case 3: // Calls
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_ic_call, color: Colors.white),
        );
      default:
        return null;
    }
  }
}
