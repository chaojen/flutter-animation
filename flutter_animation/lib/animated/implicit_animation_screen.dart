import 'dart:async';

import 'package:flutter/material.dart';

/// # [隱式動畫範例(Implicit Animation)](https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html)
///
/// 不需要自己控制播放、暫停、倒轉等等，即能使用，能夠展現諸如改變大小、顏色、位置、透明度等，
/// 隱式動畫元件通常以 Animated 作為前綴詞來命名
///
/// ## 關鍵屬性
///
/// - duration 動畫播放長度
/// - [curve](https://api.flutter.dev/flutter/animation/Curves-class.html?gclid=Cj0KCQiAsburBhCIARIsAExmsu4w36LZXfoSe_K1xMUN5ax1YLHXyoSIU2IXmkbYTp8R6_rBVfA_2m8aAoRcEALw_wcB&gclsrc=aw.ds)：預設為線性 Curves.linear
///
/// ## 本頁範例包含:
///
/// - AnimatedAlign: 對齊動畫
/// - AnimatedDefaultTextStyle: 文字動畫
/// - AnimatedScale: 動畫版本的 Transform.scale，影響大小
/// - AnimatedRotation: 旋轉動畫
/// - AnimatedSide: 滑動動畫
/// - AnimatedOpacity: 透明度動畫
/// - AnimatedPadding: Padding 動畫
/// - AnimatedPhysicalModel: 陰影動畫
/// - AnimatedPositioned: 位置動畫
/// - AnimatedPositionedDirectional: 位置方向動畫
/// - AnimatedCrossFade: 針對兩個元件執行交換的 Fade 動畫效果
/// - AnimatedSize: 大小尺寸動畫
/// - AnimatedSwitcher: 元件漸變動畫，跟 AnimatedCrossFade 類似
/// - TweenAnimationBuilder: 綜合動畫，兩值變化的動畫效果
/// - AnimatedContainer: 綜合動畫，更改支援的所有屬性都會有動畫效果
///
class ImplicitAnimationScreen extends StatefulWidget {
  static Route getRoute({required VoidCallback onAnimatedTheme}) {
    return MaterialPageRoute(
      builder: (_) {
        return ImplicitAnimationScreen(onAnimatedTheme: onAnimatedTheme);
      },
    );
  }

  final VoidCallback onAnimatedTheme;

  const ImplicitAnimationScreen({required this.onAnimatedTheme, super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool animationState = true;
  bool animationThemeState = true;
  Duration speed = const Duration(seconds: 3);
  final curve = Curves.linear;

  Timer? timer;
  final logo = const FlutterLogo(size: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicitly Animated')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            // _animatedPositionedDirectionalExample(child: _square(context)),
            Center(
              child: _animatedRotationExample(child: _square(context)),
            ),
            Positioned(bottom: 60, child: _userControllers()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget _square(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _userControllers() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => animationState = !animationState),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('PLAY'),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            if (timer?.isActive == true) {
              timer?.cancel();
            } else {
              timer?.cancel();
              timer = Timer.periodic(speed, (timer) {
                setState(() {
                  animationState = !animationState;
                });
              });
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('AUTO'),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            setState(() => widget.onAnimatedTheme());
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('ANIMATED_THEME'),
          ),
        ),
      ],
    );
  }

  /// 對齊動畫
  Widget _animatedAlignExample({required Widget child}) {
    return AnimatedAlign(
      alignment: animationState ? Alignment.centerLeft : Alignment.centerRight,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 文字動畫
  Widget _animatedDefaultTextStyleExample() {
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontSize: 60,
        color: animationState ? Colors.blue[200] : Colors.blue[800],
        fontWeight: FontWeight.normal,
      ),
      duration: speed,
      curve: curve,
      child: const Text('AnimatedDefaultTextStyle'),
    );
  }

  /// 動畫版本的 Transform.scale，影響大小
  Widget _animatedScaleExample({required Widget child}) {
    return AnimatedScale(
      scale: animationState ? 1 : 2,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 旋轉動畫
  Widget _animatedRotationExample({required Widget child}) {
    return AnimatedRotation(
      turns: animationState ? 0 : 1,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 滑動動畫
  Widget _animatedSideExample({required Widget child}) {
    return AnimatedSlide(
      offset: Offset(animationState ? -1 : 1, animationState ? -1 : 1),
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 透明度動畫
  Widget _animatedOpacityExample({required Widget child}) {
    return AnimatedOpacity(
      opacity: animationState ? 0 : 1,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// Padding 動畫
  Widget _animatedPaddingExample({required Widget child}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(animationState ? 16 : 32),
              duration: speed,
              curve: curve,
              child: child,
            ),
            AnimatedPadding(
              padding: EdgeInsets.all(animationState ? 16 : 32),
              duration: speed,
              curve: curve,
              child: child,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(animationState ? 16 : 32),
              duration: speed,
              curve: curve,
              child: child,
            ),
            AnimatedPadding(
              padding: EdgeInsets.all(animationState ? 16 : 32),
              duration: speed,
              curve: curve,
              child: child,
            ),
          ],
        ),
      ],
    );
  }

  /// 陰影動畫
  Widget _animatedPhysicalModelExample({required Widget child}) {
    return AnimatedPhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.grey,
      elevation: animationState ? 0 : 16,
      shape: BoxShape.rectangle,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 位置動畫
  Widget _animatedPositionedExample({required Widget child}) {
    return AnimatedPositioned(
      width: animationState ? 200 : 50,
      height: animationState ? 50 : 200,
      left: animationState ? 800 : 400,
      top: animationState ? 150 : 300,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 位置方向動畫
  Widget _animatedPositionedDirectionalExample({required Widget child}) {
    return AnimatedPositionedDirectional(
      width: animationState ? 200 : 50,
      height: animationState ? 50 : 200,
      start: animationState ? 800 : 400,
      top: animationState ? 150 : 300,
      duration: speed,
      curve: curve,
      child: child,
    );
  }

  /// 針對兩個元件執行交換的 Fade 動畫效果
  Widget _animatedCrossFadeExample({
    required Widget firstChild,
    required Widget secondChild,
  }) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          animationState ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: speed,
      sizeCurve: curve,
    );
  }

  /// 大小尺寸動畫
  Widget _animatedSizeExample() {
    return AnimatedSize(
      duration: speed,
      curve: curve,
      child: FlutterLogo(size: animationState ? 200 : 100),
    );
  }

  /// 元件漸變動畫，跟 AnimatedCrossFade 類似
  Widget _animatedSwitcherExample({
    required Widget firstChild,
    required Widget secondChild,
  }) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      duration: speed,
      switchInCurve: curve,
      switchOutCurve: curve,
      child: animationState ? firstChild : secondChild,
    );
  }

  /// 綜合動畫，兩值變化的動畫效果
  Widget _tweenAnimationBuilderExample({required Widget child}) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: Colors.white,
        end: animationState ? Colors.white : Colors.blue[800],
      ),
      duration: speed,
      curve: curve,
      child: child,
      builder: (BuildContext context, Color? color, Widget? child) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color ?? Colors.white,
            BlendMode.modulate,
          ),
          child: child,
        );
      },
    );
  }

  /// 綜合動畫，更改支援的所有屬性都會有動畫效果
  Widget _animatedContainerExample({required Widget child}) {
    return AnimatedContainer(
      width: animationState ? 100 : 150,
      height: animationState ? 100 : 150,
      duration: speed,
      curve: curve,
      child: child,
    );
  }
}
