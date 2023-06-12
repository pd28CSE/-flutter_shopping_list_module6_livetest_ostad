import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Test',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> _titles = [
    {
      'title': 'Apples',
      'icon': const Icon(
        Icons.apple,
        color: Colors.green,
      )
    },
    {
      'title': 'Mobile',
      'icon': const Icon(
        Icons.mobile_friendly,
        color: Colors.black,
      )
    },
    {
      'title': 'Alarm Clock',
      'icon': const Icon(
        Icons.access_alarm,
        color: Colors.black,
      )
    },
    {
      'title': 'Car',
      'icon': const Icon(
        Icons.airport_shuttle_rounded,
        color: Colors.deepPurple,
      )
    },
    {
      'title': 'Eggs',
      'icon': const Icon(
        Icons.egg,
        color: Color.fromARGB(255, 235, 220, 177),
      )
    },
    {
      'title': 'Football',
      'icon': const Icon(
        Icons.sports_football,
        color: Colors.black,
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showSnackbar(context),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: _titles.length,
        itemBuilder: (context, index) => _buildListTile(
          title: _titles[index]['title'],
          icon: _titles[index]['icon'],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8.0,
        ),
      ),
    );
  }

  ListTile _buildListTile({required Icon icon, required String title}) {
    return ListTile(
      tileColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cart is empty.'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
