import 'dart:async';

import 'package:flutter/material.dart';

class Christmas2023Screen extends StatefulWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const Christmas2023Screen());
  }

  const Christmas2023Screen({super.key});

  @override
  State<Christmas2023Screen> createState() => _Christmas2023ScreenState();
}

class _Christmas2023ScreenState extends State<Christmas2023Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _playPauseAnimationController;
  Timer? _timer;
  final _animationDuration = const Duration(milliseconds: 200);
  final _gifts = _members.map((member) => _Gift(member, member)).toList();

  @override
  void initState() {
    super.initState();
    _playPauseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: const Text('Merry Christmas 2023 and Happy New Year 2024 !!!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              for (var member in _members) {
                member.isExchange = true;
              }
            },
          ),
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _playPauseAnimationController,
            ),
            onPressed: () {
              if (_timer?.isActive == true) {
                _timer?.cancel();
                _playPauseAnimationController.reverse();
              } else {
                _timer = Timer.periodic(
                  _animationDuration,
                  (timer) => _shuffleGifts(),
                );
                _playPauseAnimationController.forward();
              }
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/christmas_wallpaper.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          ..._members.map((member) => _buildMember(member)).toList(),
          ..._gifts.map((gift) => _buildGift(gift)).toList(),
        ],
      ),
    );
  }

  Widget _buildMember(_Member member) {
    return Positioned(
      top: member.position.dy,
      left: member.position.dx,
      child: GestureDetector(
        onTap: () => setState(() => member.isExchange = !member.isExchange),
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor:
                  member.isExchange ? Colors.green[800] : Colors.green[200],
              maxRadius: _memberMaxRadius,
              child: CircleAvatar(
                backgroundColor:
                    member.isExchange ? Colors.green[700] : Colors.green[200],
                maxRadius: _memberMaxRadius - 8,
                child: Text(
                  member.name,
                  style:
                      const TextStyle(color: Colors.black, fontSize: _textSize),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Image.asset(
                member.decoration,
                width: 90,
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGift(_Gift gift) {
    return AnimatedPositioned(
      top: gift.receiver.giftBoxPosition.dy,
      left: gift.receiver.giftBoxPosition.dx,
      duration: _animationDuration,
      curve: Curves.easeInOut,
      child: CircleAvatar(
        backgroundColor:
            gift.receiver.isExchange ? Colors.amber[600] : Colors.amber[200],
        maxRadius: _giftMaxRadius,
        child: CircleAvatar(
          backgroundColor:
              gift.receiver.isExchange ? Colors.amber[500] : Colors.amber[200],
          maxRadius: _giftMaxRadius - 8,
          child: Text(
            gift.sender.name,
            style: const TextStyle(color: Colors.black, fontSize: _textSize),
          ),
        ),
      ),
    );
  }

  void _shuffleGifts() {
    final List<_Gift> exchangeGifts =
        _gifts.where((gift) => gift.receiver.isExchange).toList();

    final List<_Member> receivers =
        exchangeGifts.map((gift) => gift.receiver).toList()..shuffle();

    for (var index = 0; index < exchangeGifts.length; index++) {
      exchangeGifts[index].receiver = receivers[index];
    }

    setState(() => _gifts);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class _Gift {
  final _Member sender;
  _Member receiver;
  final decoration = 'assets/christmas_present.png';

  _Gift(this.sender, this.receiver);
}

class _Member {
  final String name;
  final Offset position;
  final Offset giftBoxPosition;
  bool isExchange = true;
  String decoration;

  _Member({
    required this.name,
    required this.position,
    required this.giftBoxPosition,
    this.decoration = 'assets/christmas_decoration_hat.png',
  });
}

const _memberMaxRadius = 100.0;
const _giftMaxRadius = 50.0;
const _textSize = 25.0;
const _firstRowTop = 16.0;
const _secondRowTop = 590.0;
const _paddingLeft = 15.0;
const _horizonGap = 240;

final _members = [
  _Member(
    name: 'Alan',
    position: const Offset(_horizonGap * 0 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 0 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_giraffe.png',
  ),
  _Member(
    name: 'Annie',
    position: const Offset(_horizonGap * 1 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 1 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_isabelle.png',
  ),
  _Member(
    name: 'Ben',
    position: const Offset(_horizonGap * 2 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 2 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_ben.png',
  ),
  _Member(
    name: 'Enn',
    position: const Offset(_horizonGap * 3 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 3 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_spiderman.png',
  ),
  _Member(
    name: 'Jack',
    position: const Offset(_horizonGap * 4 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 4 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_fitness.png',
  ),
  _Member(
    name: 'Jeff',
    position: const Offset(_horizonGap * 5 + _paddingLeft, _firstRowTop),
    giftBoxPosition:
        const Offset(_horizonGap * 5 + 50 + _paddingLeft, _firstRowTop + 124),
    decoration: 'assets/christmas_decoration_deer.png',
  ),
  _Member(
    name: 'Jhen',
    position: const Offset(_horizonGap * 0 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 0 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_dodoro.png',
  ),
  _Member(
    name: 'Ken',
    position: const Offset(_horizonGap * 1 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 1 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_owl.png',
  ),
  _Member(
    name: 'Pete',
    position: const Offset(_horizonGap * 2 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 2 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_pete.png',
  ),
  _Member(
    name: 'Peter',
    position: const Offset(_horizonGap * 3 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 3 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_doge.png',
  ),
  _Member(
    name: 'R',
    position: const Offset(_horizonGap * 4 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 4 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_r.png',
  ),
  _Member(
    name: 'Rita',
    position: const Offset(_horizonGap * 5 + _paddingLeft, _secondRowTop + 35),
    giftBoxPosition:
        const Offset(_horizonGap * 5 + 5 + _paddingLeft, _secondRowTop),
    decoration: 'assets/christmas_decoration_grandpa.png',
  ),
];
