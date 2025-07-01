// experiment-6 - want to demonstrate how to use stateful widget

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Experiment-6', home: CounterScreen());
  }
}

// CounterScreen Widget
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// CounterScreenState Widget
class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experiment-6'),backgroundColor: const Color.fromARGB(255, 14, 109, 243),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
