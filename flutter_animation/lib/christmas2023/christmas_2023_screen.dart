import 'package:flutter/material.dart';

class Christmas2023Screen extends StatefulWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const Christmas2023Screen());
  }

  const Christmas2023Screen({super.key});

  @override
  State<Christmas2023Screen> createState() => _Christmas2023ScreenState();
}

class _Christmas2023ScreenState extends State<Christmas2023Screen> {
  final duration = const Duration(seconds: 1);
  final _avatarMaxRadius = 100.0;
  final _giftMaxRadius = 50.0;
  final _giftBackgroundColor = Colors.orange;
  final _memberPositions = [
    const Offset(230 * 0, 0),
    const Offset(230 * 1, 0),
    const Offset(230 * 2, 0),
    const Offset(230 * 3, 0),
    const Offset(230 * 4, 0),
    const Offset(230 * 5, 0),
    const Offset(230 * 0, 0),
    const Offset(230 * 1, 0),
    const Offset(230 * 2, 0),
    const Offset(230 * 3, 0),
    const Offset(230 * 4, 0),
    const Offset(230 * 5, 0),
  ];
  final _members = [
    _Member('Pete'),
    _Member('Alan'),
    _Member('Annie'),
    _Member('Ben'),
    _Member('Enn'),
    _Member('Jack'),
    _Member('Jeff'),
    _Member('Jhen'),
    _Member('Ken'),
    _Member('R'),
    _Member('Peter'),
    _Member('Rita'),
  ];
  final _giftPositions = [
    const Offset(230 * 0 + 50, 140),
    const Offset(230 * 1 + 50, 140),
    const Offset(230 * 2 + 50, 140),
    const Offset(230 * 3 + 50, 140),
    const Offset(230 * 4 + 50, 140),
    const Offset(230 * 5 + 50, 140),
    const Offset(230 * 0 + 50, 140),
    const Offset(230 * 1 + 50, 140),
    const Offset(230 * 2 + 50, 140),
    const Offset(230 * 3 + 50, 140),
    const Offset(230 * 4 + 50, 140),
    const Offset(230 * 5 + 50, 140),
  ];
  final _gifts = [
    _Member('Pete'),
    _Member('Alan'),
    _Member('Annie'),
    _Member('Ben'),
    _Member('Enn'),
    _Member('Jack'),
    _Member('Jeff'),
    _Member('Jhen'),
    _Member('Ken'),
    _Member('R'),
    _Member('Peter'),
    _Member('Rita'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2023 聖誕交換禮物')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              top: _memberPositions[0].dy,
              left: _memberPositions[0].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[0].name),
              ),
            ),
            Positioned(
              top: _memberPositions[1].dy,
              left: _memberPositions[1].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[1].name),
              ),
            ),
            Positioned(
              top: _memberPositions[2].dy,
              left: _memberPositions[2].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[2].name),
              ),
            ),
            Positioned(
              top: _memberPositions[3].dy,
              left: _memberPositions[3].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[3].name),
              ),
            ),
            Positioned(
              top: _memberPositions[4].dy,
              left: _memberPositions[4].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[4].name),
              ),
            ),
            Positioned(
              top: _memberPositions[5].dy,
              left: _memberPositions[5].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[5].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[6].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[6].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[7].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[7].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[8].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[8].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[9].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[9].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[10].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[10].name),
              ),
            ),
            Positioned(
              bottom: 0,
              left: _memberPositions[11].dx,
              child: CircleAvatar(
                maxRadius: _avatarMaxRadius,
                child: Text(_members[11].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[0].dy,
              left: _giftPositions[0].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[0].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[1].dy,
              left: _giftPositions[1].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[1].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[2].dy,
              left: _giftPositions[2].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[2].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[3].dy,
              left: _giftPositions[3].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[3].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[4].dy,
              left: _giftPositions[4].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[4].name),
              ),
            ),
            AnimatedPositioned(
              top: _giftPositions[5].dy,
              left: _giftPositions[5].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[5].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[6].dy,
              left: _giftPositions[6].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[6].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[7].dy,
              left: _giftPositions[7].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[7].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[8].dy,
              left: _giftPositions[8].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[8].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[9].dy,
              left: _giftPositions[9].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[9].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[10].dy,
              left: _giftPositions[10].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[10].name),
              ),
            ),
            AnimatedPositioned(
              bottom: _giftPositions[11].dy,
              left: _giftPositions[11].dx,
              duration: duration,
              child: CircleAvatar(
                backgroundColor: _giftBackgroundColor,
                maxRadius: _giftMaxRadius,
                child: Text(_members[11].name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Member {
  final String name;

  _Member(this.name);
}
