// Experiment-10: Flutter App with Animations like Fade, Sliding, and Scaling

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Animations'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Fade Animation'),
              Tab(text: 'Slide Animation'),
              Tab(text: 'Scale Animation'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FadeAnimationDemo(),
            SlideAnimationDemo(),
            ScaleAnimationDemo(),
          ],
        ),
      ),
    );
  }
}

class FadeAnimationDemo extends StatefulWidget {
  const FadeAnimationDemo({super.key});

  @override
  State<FadeAnimationDemo> createState() => _FadeAnimationDemoState();
}

class _FadeAnimationDemoState extends State<FadeAnimationDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Text(
              'Fade Animation',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: Text('Toggle Fade'),
          ),
        ],
      ),
    );
  }
}

class SlideAnimationDemo extends StatefulWidget {
  const SlideAnimationDemo({super.key});

  @override
  State<SlideAnimationDemo> createState() => _SlideAnimationDemoState();
}

class _SlideAnimationDemoState extends State<SlideAnimationDemo> {
  double _offset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            transform: Matrix4.translationValues(_offset, 0, 0),
            duration: Duration(seconds: 1),
            child: Text(
              'Slide Animation',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _offset = _offset == 0.0 ? 100.0 : 0.0;
              });
            },
            child: Text('Toggle Slide'),
          ),
        ],
      ),
    );
  }
}

class ScaleAnimationDemo extends StatefulWidget {
  const ScaleAnimationDemo({super.key});

  @override
  State<ScaleAnimationDemo> createState() => _ScaleAnimationDemoState();
}

class _ScaleAnimationDemoState extends State<ScaleAnimationDemo> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            transform: Matrix4.diagonal3Values(_scale, _scale, 1.0),
            duration: Duration(seconds: 1),
            child: Text(
              'Scale Animation',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _scale = _scale == 1.0 ? 2.0 : 1.0;
              });
            },
            child: Text('Toggle Scale'),
          ),
        ],
      ),
    );
  }
}
