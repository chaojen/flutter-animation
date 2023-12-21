import 'package:flutter/material.dart';

class DecisionTreeScreen extends StatefulWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const DecisionTreeScreen());
  }

  const DecisionTreeScreen({super.key});

  @override
  State<DecisionTreeScreen> createState() => _DecisionTreeScreenState();
}

class _DecisionTreeScreenState extends State<DecisionTreeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emily Fortuna\'s Decision Tree')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: InteractiveViewer(
              panEnabled: false,
              minScale: 0.5,
              maxScale: 4,
              child: Image.asset('assets/emily-fortuna-decision.png'),
            ),
          ),
        ),
      ),
    );
  }
}
