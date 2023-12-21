import 'dart:math' as math;
import 'package:flutter/material.dart';

/// # [顯式動畫範例(Explicit Animation)](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
///
/// 1. AnimationController: 控制動畫的播放，能設定包含動畫時長、播放、暫停、倒轉等
/// 2. Built-in Explicit Animation: FooTransition，使用 Flutter 提供的常用動畫
/// 3. 用 AnimatedWidget 來包裝自己的動畫
/// 4. Flutter 提供的 AnimatedIcons
///
/// ## AnimationController
/// 
/// 負責產生畫面每一幀所對應的數值，
/// 需要給予 vsync 參數，
/// 以便觀察畫面的每一幀刷新，
/// vsync 為 with SingleTickerProviderStateMixin 或 TickerProviderStateMixin 的 StatefulWidget State， 
///
/// ## Built-in Explicit Animation: FooTransition
/// 
/// 顯式動畫元件通常以 Transition 作為後綴詞命名，如下:
/// 
/// - AlignTransition, which is an animated version of Align.
/// - DecoratedBoxTransition, which is an animated version of DecoratedBox.
/// - DefaultTextStyleTransition, which is an animated version of DefaultTextStyle.
/// - PositionedTransition, which is an animated version of Positioned.
/// - RelativePositionedTransition, which is an animated version of Positioned.
/// - RotationTransition, which animates the rotation of a widget.
/// - ScaleTransition, which animates the scale of a widget.
/// - SizeTransition, which animates its own size.
/// - SlideTransition, which animates the position of a widget relative to its normal position.
/// - FadeTransition, which is an animated version of Opacity.
/// - AnimatedModalBarrier, which is an animated version of ModalBarrier.
/// 
/// 當 Flutter 原生動畫元件無法滿足時，可以利用 [AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html) 或 AnimatedBuilder 來完成需求，
/// AnimatedWidget 可以把原本 AnimatedBuilder 的部分從 Widget Tree 中隔開，提高可讀性，後續也可以複用:
/// 
/// - ListenableBuilder, which uses a builder pattern that is useful for complex Listenable use cases.
/// - AnimatedBuilder, which uses a builder pattern that is useful for complex Animation use cases.
///
/// ## [AnimatedIcons](https://api.flutter.dev/flutter/material/AnimatedIcons-class.html)
/// 
/// 動畫 Icon 的部分，目前僅有限提供，可以呈現兩種 Icon 之間的切換
/// 
/// ## Animation
/// 
/// 利用 Tween Animation、Physics Animation 作插值器(interpolator)效果
///
class ExplicitAnimationScreen extends StatefulWidget {
  static get route {
    return MaterialPageRoute(builder: (_) => const ExplicitAnimationScreen());
  }

  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() =>
      _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  final logo = const FlutterLogo(size: 200);
  late final AnimationController _controller;

  String _controllerStatus = '';
  double _controllerValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..addStatusListener((status) {
        setState(() {
          _controllerStatus = _controller.status.name;
        });
      })
      ..addListener(() {
        setState(() {
          _controllerValue = _controller.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicitly Animated')),
      body: Stack(children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _monitor(),
          ),
        ),
        Center(
          child: RotationTransition(
            turns: _controller,
            child: logo,
          ),
        ),
        // Center(
        //   child: AnimatedBuilder(
        //     animation: _controller,
        //     builder: (_, child) {
        //       return Transform.rotate(
        //         angle: _controller.value * 2.0 * math.pi,
        //         child: child,
        //       );
        //     },
        //     child: logo,
        //   ),
        // ),
        // Center(
        //   child: CustomTransition(
        //     controller: _controller,
        //     child: logo,
        //   ),
        // ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _controllers(),
          ),
        )
      ]),
    );
  }

  Widget _monitor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Controller', style: TextStyle(fontSize: 20)),
        Text('Status: $_controllerStatus'),
        Text('Value: $_controllerValue'),
      ],
    );
  }

  Widget _square(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _controllers() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => _controller.forward(),
          child: const Text('FORWARD'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.reverse(),
          child: const Text('REVERSE'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.stop(),
          child: const Text('STOP'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.reset(),
          child: const Text('RESET'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.repeat(),
          child: const Text('REPEAT'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.repeat(reverse: true),
          child: const Text('REPEAT(reverse)'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => _controller.fling(),
          child: const Text('FLING'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomTransition extends AnimatedWidget {
  const CustomTransition({
    super.key,
    required AnimationController controller,
    required this.child,
  }) : super(listenable: controller);

  final Widget child;
  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: child,
    );
  }
}
