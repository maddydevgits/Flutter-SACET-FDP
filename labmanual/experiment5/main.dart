import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

// -------------------- App Root --------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}

// -------------------- HomeScreen with Tabs --------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Widget & State Demo"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Stateless"),
              Tab(text: "setState"),
              Tab(text: "Provider"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StatelessExample(),
            SetStateExample(),
            ProviderExample(),
          ],
        ),
      ),
    );
  }
}

// -------------------- 1. Stateless Widget --------------------

class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is a Stateless Widget",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// -------------------- 2. Stateful Widget with setState --------------------

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: $counter", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: increment,
            child: const Text("Increment"),
          )
        ],
      ),
    );
  }
}

// -------------------- 3. Provider State Management --------------------

class CounterProvider extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Provider Counter: ${counter.value}", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              counter.increment();
            },
            child: const Text("Increment via Provider"),
          )
        ],
      ),
    );
  }
}
