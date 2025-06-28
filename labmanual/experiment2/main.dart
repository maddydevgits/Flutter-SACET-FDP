import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterWidgetsDemoApp());
}

class FlutterWidgetsDemoApp extends StatelessWidget {
  const FlutterWidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets & Layout Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Tabs for Column, Row, Stack
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Widgets & Layout Demo"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Column"),
              Tab(text: "Row"),
              Tab(text: "Stack"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColumnLayoutDemo(),
            RowLayoutDemo(),
            StackLayoutDemo(),
          ],
        ),
      ),
    );
  }
}

class ColumnLayoutDemo extends StatelessWidget {
  const ColumnLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Column Layout", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(color: Colors.amber, height: 100, width: 100),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text("Press Me")),
          const SizedBox(height: 20),
          const Icon(Icons.star, size: 40, color: Colors.purple),
        ],
      ),
    );
  }
}

class RowLayoutDemo extends StatelessWidget {
  const RowLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Row 1"),
          Container(color: Colors.blue, height: 100, width: 100),
          const Icon(Icons.favorite, color: Colors.red, size: 40),
        ],
      ),
    );
  }
}

class StackLayoutDemo extends StatelessWidget {
  const StackLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(height: 200, width: 200, color: Colors.green),
          const Positioned(
            top: 10,
            left: 10,
            child: Text("Top Left", style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            child: Icon(Icons.circle, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
