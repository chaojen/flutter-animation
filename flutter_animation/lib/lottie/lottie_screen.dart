import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// # [lottie](https://pub.dev/packages/lottie)
/// 
/// Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with Bodymovin and renders them natively on mobile!
/// This repository is an unofficial conversion of the Lottie-android library in pure Dart.
/// It works on Android, iOS, macOS, linux, windows and web.
/// 
class LottieScreen extends StatelessWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const LottieScreen());
  }

  const LottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie for Flutter')),
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'little-Y',
              child: Lottie.asset(
                'assets/login_ufo.json',
                width: 900,
                height: 900,
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150, left: 16, right: 16),
              child: Text(
                '''
Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with Bodymovin and renders them natively on mobile!
            
This repository is an unofficial conversion of the Lottie-android library in pure Dart.
            
It works on Android, iOS, macOS, linux, windows and web.
''',
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Lottie.asset(
              'assets/main_gamer.json',
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
