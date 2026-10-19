

import 'package:flutter/material.dart';

void main() => runApp(const GymPro());

class GymPro extends StatelessWidget {
  const GymPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GYM PRO',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GYM PRO'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome to GYM PRO',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          buildCard('Workout Plans', Icons.fitness_center),
          buildCard('Exercise Tracking', Icons.timer),
          buildCard('Fitness Dashboard', Icons.bar_chart),
          buildCard('My Profile', Icons.person),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

