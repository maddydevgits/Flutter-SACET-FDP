// Experiment-2: Display an image in a container

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment-2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Experiment-2'),
          backgroundColor: Color.fromARGB(255, 124, 124, 194),
        ),
        body: Center(
          child: Container(
            width: 1000,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 2),
              image: DecorationImage(
                image: NetworkImage(
                  'https://myhr.makeskilled.com/static/images/logoms.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
