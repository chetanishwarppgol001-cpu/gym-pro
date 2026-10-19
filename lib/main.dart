

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
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<String>> workouts = {
    'Chest': [
      'Push Ups',
      'Wall Push Ups',
      'Chest Stretch',
    ],
    'Arms': [
      'Arm Circles',
      'Wall Push Ups',
      'Triceps Stretch',
    ],
    'Legs': [
      'Squats',
      'Calf Raises',
      'Lunges',
    ],
    'Abs': [
      'Plank',
      'Crunches',
      'Dead Bug',
    ],
    'Full Body': [
      'Marching',
      'Squats',
      'Push Ups',
      'Plank',
    ],
  };

  final Set<String> completed = {};

  int get totalExercises =>
      workouts.values.fold(0, (sum, list) => sum + list.length);

  String exerciseKey(String group, int index) =>
      '$group-$index';

  void openWorkout(String group) {
    final exercises = workouts[group]!;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('$group Workout'),
            backgroundColor: Colors.green.shade800,
          ),
          body: StatefulBuilder(
            builder: (context, updatePage) {
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final key = exerciseKey(group, index);
                  final done = completed.contains(key);

                  return Card(
                    child: ListTile(
                      leading: Icon(
                        done
                            ? Icons.check_circle
                            : Icons.fitness_center,
                        color: Colors.green,
                      ),
                      title: Text(exercises[index]),
                      subtitle: Text(
                        done ? 'Completed' : 'Not completed',
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (done) {
                              completed.remove(key);
                            } else {
                              completed.add(key);
                            }
                          });
                          updatePage(() {});
                        },
                        child: Text(done ? 'Undo' : 'Complete'),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void openProgress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Fitness Dashboard'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bar_chart,
                  size: 80,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  '${completed.length} / $totalExercises',
                  style: const TextStyle(fontSize: 32),
                ),
                const Text('Exercises Completed'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCard(
    String title,
    IconData icon,
    VoidCallback action,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: action,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GYM PRO'),
        backgroundColor: Colors.green.shade800,
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
          const SizedBox(height: 12),
          Text(
            'Completed: ${completed.length} / $totalExercises',
          ),
          const SizedBox(height: 20),
          ...workouts.keys.map(
            (group) => menuCard(
              '$group Workout',
              Icons.fitness_center,
              () => openWorkout(group),
            ),
          ),
          menuCard(
            'Fitness Dashboard',
            Icons.bar_chart,
            openProgress,
          ),
        ],
      ),
    );
  }
}

