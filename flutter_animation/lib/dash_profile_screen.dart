import 'package:flutter/material.dart';

class DashProfileScreen extends StatelessWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const DashProfileScreen());
  }

  const DashProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Who is Dash ?')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 130,
            child: Hero(
              tag: 'dash',
              child: Image.asset('assets/dash.png', width: 220, height: 220),
            ),
          ),
          const SizedBox(height: 8),
          const Center(child: Text('This is Dash')),
          const SizedBox(height: 16),
          const Text(
            '''
Dash is the mascot for the Dart language and the Flutter framework.

As soon as Shams Zakhour started working as a Dart writer at Google in December 2013, she started advocating for a Dart mascot. After documenting Java for 14 years, she had observed how beloved the Java mascot, Duke, had become, and she wanted something similar for Dart.

But the idea didn’t gain momentum until 2017, when one of the Flutter engineers, Nina Chen, suggested it on an internal mailing list. The Flutter VP at the time, Joshy Joseph, approved the idea and asked the organizer for the 2018 Dart Conference, Linda Rasmussen, to make it happen.

Once Shams heard about these plans, she rushed to Linda and asked to own and drive the project to produce the plushies for the conference. Linda had already elicited some design sketches, which she handed off. Starting with the sketches, Shams located a vendor who could work within an aggressive deadline (competing with Lunar New Year), and started the process of creating the specs for the plushy.

That’s right, Dash was originally a Dart mascot, not a Flutter mascot.''',
          ),
        ],
      ),
    );
  }
}
