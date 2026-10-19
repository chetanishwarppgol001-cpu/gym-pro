
import 'package:flutter/material.dart';

void main() {
  runApp(const GymPro());
}

class GymPro extends StatelessWidget {
  const GymPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GYM PRO',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GYM PRO'),
        ),
        body: const Center(
          child: Text(
            'Welcome to GYM PRO',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
