import 'package:flutter/material.dart';

void main() {
  runApp(const MyThemedApp());
}

// --------------------- App Root ---------------------

class MyThemedApp extends StatelessWidget {
  const MyThemedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget & Theme Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// --------------------- HomeScreen ---------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widgets & Theming")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Welcome to Flutter Lab!", style: textTheme.headlineMedium),
            const SizedBox(height: 20),
            const CustomCardWidget(
              title: "Flutter Widget",
              subtitle: "A powerful UI toolkit",
              icon: Icons.flutter_dash,
            ),
            const SizedBox(height: 20),
            const CustomCardWidget(
              title: "Custom Styling",
              subtitle: "Using ThemeData and TextStyle",
              icon: Icons.color_lens,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Themed Button"),
            )
          ],
        ),
      ),
    );
  }
}

// --------------------- Custom Widget ---------------------

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
        leading: Icon(icon, size: 40, color: Colors.indigo),
        title: Text(title, style: textTheme.bodyLarge),
        subtitle: Text(subtitle),
      ),
    );
  }
}
