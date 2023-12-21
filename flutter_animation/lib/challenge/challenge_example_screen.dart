import 'package:flutter/material.dart';

class ChallengeExampleScreen extends StatefulWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const ChallengeExampleScreen());
  }

  const ChallengeExampleScreen({super.key});

  @override
  State<ChallengeExampleScreen> createState() => _ChallengeExampleScreenState();
}

class _ChallengeExampleScreenState extends State<ChallengeExampleScreen>
    with TickerProviderStateMixin {
  late AnimationController _typingAnimationController;
  late Animation _typingAnimation;

  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();

    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.forward:
            _buttonAnimationController.forward();
          case AnimationStatus.completed:
            _buttonAnimationController.reverse();
          default:
        }
      });

    _typingAnimation = TypingTween(
      begin: '',
      end: 'hello, animation',
    ).animate(CurvedAnimation(
      parent: _typingAnimationController,
      curve: Curves.easeInOutSine,
    ));

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Challenge Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _typingAnimation,
              builder: (_, child) {
                return Text(
                  _typingAnimation.value,
                  style: const TextStyle(fontSize: 32),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: OutlinedButton(
              onPressed: () {
                switch (_typingAnimationController.status) {
                  case AnimationStatus.forward:
                    if (_typingAnimationController.isAnimating) {
                      _typingAnimationController.stop();
                      _buttonAnimationController.reverse();
                    } else {
                      _typingAnimationController.forward();
                      _buttonAnimationController.forward();
                    }
                  case AnimationStatus.completed:
                    _typingAnimationController
                      ..reset()
                      ..forward();
                  case AnimationStatus.dismissed:
                    _typingAnimationController.forward();
                  default:
                }
              },
              child: Hero(
                tag: 'play',
                child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: _buttonAnimationController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _typingAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }
}

class TypingTween extends Tween<String> {
  TypingTween({String begin = '', String? end}) : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    final endStringLength = end?.length ?? 0;
    final cutPosition = (endStringLength * t).round();
    return end?.substring(0, cutPosition) ?? '';
  }
}
