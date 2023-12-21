import 'package:flutter/material.dart';
import 'package:flutter_animation/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool animtedThemeState = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 主題風格動畫
        colorScheme: ColorScheme.fromSeed(
          seedColor: animtedThemeState ? Colors.amber : Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(
        onAnimatedTheme: () {
          setState(() {
            animtedThemeState = !animtedThemeState;
          });
        },
      ),
    );
  }
}
