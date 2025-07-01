// experiment8 - custom widgets

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment-8',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.deepOrange),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Experiment-8')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Welcome to Flutter Lab", style: textTheme.headlineMedium),
            SizedBox(height: 20),
            CustomCardWidget(
              title: "Flutter Widget",
              subtitle: "UI Tool Kit",
              icon: Icons.flutter_dash,
            ),
            SizedBox(height: 20),
            CustomCardWidget(
              title: "Custom Style",
              subtitle: "Using ThemeData",
              icon: Icons.color_lens,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Hello World!",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget
class CustomCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.deepOrange),
        title: Text(title, style: textTheme.bodyLarge),
        subtitle: Text(subtitle),
      ),
    );
  }
}
