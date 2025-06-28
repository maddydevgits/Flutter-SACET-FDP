// Responsive UI
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Experiment-4', home: ResponsiveHomePage());
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the Screen Width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment-4'),
        backgroundColor: Color.fromARGB(255, 150, 150, 237),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // switch between coloumn or row based on screen width
          bool isWide = constraints.maxWidth > 600;
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 700),
              child: isWide
                  ? Row(children: _buildProfileContent())
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildProfileContent(),
                    ),
            ),
          );
        },
      ),
    );
  }

  // Reusable component displaying Circle Avator and our name with designation
  List<Widget> _buildProfileContent() {
    return [
      CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/images/fdp.png'),
      ),
      SizedBox(width: 20, height: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Madhu P',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Solutions Architect & CEO', style: TextStyle(fontSize: 22)),
            Text('Make Skilled', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    ];
  }
}
