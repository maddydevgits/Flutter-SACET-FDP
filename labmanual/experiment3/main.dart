import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveDemoApp());
}

class ResponsiveDemoApp extends StatelessWidget {
  const ResponsiveDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Responsive UI Demo")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (screenWidth < 600) {
            return const MobileLayout();
          } else if (screenWidth >= 600 && screenWidth < 1024) {
            return const TabletLayout();
          } else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Mobile View",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tablet View",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Desktop View",
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
