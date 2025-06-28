import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationDemoApp());
}

class AnimationDemoApp extends StatelessWidget {
  const AnimationDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  const AnimationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UI Animations in Flutter"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Fade"),
              Tab(text: "Slide"),
              Tab(text: "Scale"),
            ],
          ),
        ),
        body: const TabBarView(
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

// ---------------- FADE Animation ----------------

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
            duration: const Duration(seconds: 1),
            child: const FlutterLogo(size: 100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: const Text("Toggle Fade"),
          )
        ],
      ),
    );
  }
}

// ---------------- SLIDE Animation ----------------

class SlideAnimationDemo extends StatefulWidget {
  const SlideAnimationDemo({super.key});

  @override
  State<SlideAnimationDemo> createState() => _SlideAnimationDemoState();
}

class _SlideAnimationDemoState extends State<SlideAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSlide() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: const FlutterLogo(size: 100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _startSlide,
            child: const Text("Start Slide"),
          )
        ],
      ),
    );
  }
}

// ---------------- SCALE Animation ----------------

class ScaleAnimationDemo extends StatefulWidget {
  const ScaleAnimationDemo({super.key});

  @override
  State<ScaleAnimationDemo> createState() => _ScaleAnimationDemoState();
}

class _ScaleAnimationDemoState extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startScale() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: const FlutterLogo(size: 100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _startScale,
            child: const Text("Start Scale"),
          )
        ],
      ),
    );
  }
}
