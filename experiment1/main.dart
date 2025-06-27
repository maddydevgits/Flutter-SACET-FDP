// Importing material package of flutter into our project
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Stateful Widget (dynamic), Stateless Widget (static)
// Dynamic (changes per time), Static (constant)
// our context is to display your name (static)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // build whatever you want
    return MaterialApp(
      title: 'Experiement-1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Experiment-1'),
          backgroundColor: Color.fromARGB(255, 22, 96, 233),
        ),
        body: 
        Center(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Madhu Parvathaneni',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 0, 255),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Solutions Architect & CEO',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Make Skilled',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 255, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
