import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/challenge/challenge_example_screen.dart';
import 'package:flutter_animation/christmas2023/christmas_2023_screen.dart';
import 'package:flutter_animation/dash_profile_screen.dart';
import 'package:flutter_animation/decision_tree_screen.dart';
import 'package:flutter_animation/animated/explicit_animation_screen.dart';
import 'package:flutter_animation/animated/implicit_animation_screen.dart';
import 'package:flutter_animation/lottie/lottie_screen.dart';
import 'package:flutter_animation/signature/signature_screen.dart';
import 'package:lottie/lottie.dart';

/// # Flutter 動畫類型與它們的適用場景
///
/// 詳細請參考: [Animations tutorial](https://docs.flutter.dev/ui/animations/tutorial)
///
/// ## 目錄
///
/// 1. Implicit Animation: framework 控制的動畫元件
/// 2. Explicit Animation: 自己控制的動畫元件
/// 3. Hero Animation: 轉場動畫的元件
/// 4. Lottie Animation: 支援 Adobe After Effects 動畫的套件
/// 5. Emily Fortuna's decision tree: 以上動畫類型適用的場景判斷方式參考
/// 6. Challenge: 綜合以上所學來個挑戰，完成文字打字效果的動畫
/// 7. 實作簽名板: 與動畫無關，簽名板用到 CustomPainter 繪製與後需輸出方法
///
class HomeScreen extends StatefulWidget {
  final VoidCallback onAnimatedTheme;

  const HomeScreen({required this.onAnimatedTheme, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const trailing = CupertinoListTileChevron();
    final items = [
      ListTile(
        title: const Text('Implicit Animation'),
        subtitle: const Text('letting framework control'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(
          ImplicitAnimationScreen.getRoute(
            onAnimatedTheme: widget.onAnimatedTheme,
          ),
        ),
      ),
      ListTile(
        title: const Text('Explicit Animation'),
        subtitle: const Text('control by yourself'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(ExplicitAnimationScreen.route),
      ),
      ListTile(
        leading: Hero(tag: 'dash', child: Image.asset('assets/dash.png')),
        minLeadingWidth: 50,
        title: const Text('Who is Dash ?'),
        subtitle: const Text('hero animation example'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(DashProfileScreen.route),
      ),
      ListTile(
        leading: Hero(tag: 'little-Y', child: Lottie.asset('assets/ufo.json')),
        minLeadingWidth: 50,
        title: const Text('Lottie for Flutter'),
        subtitle: const Text('parses Adobe After Effects animations'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(LottieScreen.route),
      ),
      ListTile(
        leading: const Icon(Icons.lan_rounded),
        minLeadingWidth: 50,
        title: const Text('Emily Fortuna\'s decision tree'),
        subtitle: const Text(
          'how to choose which Flutter animation widget is right for you?',
        ),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(DecisionTreeScreen.route),
      ),
      ListTile(
        leading: const Hero(tag: 'play', child: Icon(Icons.play_arrow)),
        minLeadingWidth: 50,
        title: const Text('Challenge'),
        subtitle: const Text('typing animation'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(ChallengeExampleScreen.route),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.signature),
        minLeadingWidth: 50,
        title: const Text('Signature Board'),
        subtitle: const Text('use GestureDetector & CustomPainter'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(SignatureScreen.route),
      ),
      ListTile(
        leading: const Icon(CupertinoIcons.gift_fill),
        minLeadingWidth: 50,
        title: const Text('2023 聖誕交換禮物'),
        subtitle: const Text('主辦人: Pete'),
        trailing: trailing,
        onTap: () => Navigator.of(context).push(Christmas2023Screen.route),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animation')),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: items.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, indent: 16),
            itemBuilder: (BuildContext context, int index) => items[index],
          ),
        ],
      ),
    );
  }
}
