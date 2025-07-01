// experiment7 - share information - provider

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CounterProvider(), child: MyApp()),
  );
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Experiment-7', home: ProviderCounterScreen());
  }
}

// ProviderScreen
class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>(); // subscribing to provider class

    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment-7'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Provider Counter: ${counter.value}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: counter.incrementValue,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// Provider class
class CounterProvider extends ChangeNotifier {
  int value = 0;

  void incrementValue() {
    value++;
    notifyListeners();
  }
}
