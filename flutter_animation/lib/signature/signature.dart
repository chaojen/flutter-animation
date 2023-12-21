import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SignatureController {
  VoidCallback _onClearListener = () {};

  void addOnClearListener(VoidCallback newListener) {
    _onClearListener = newListener;
  }

  void clear() {
    _onClearListener();
  }
}

/// 實作簽名板
class Signature extends StatefulWidget {
  final SignatureController _controller;

  const Signature({
    super.key,
    required SignatureController controller,
  }) : _controller = controller;

  @override
  State<Signature> createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  final ValueNotifier<List<List<Offset>>> _lines = ValueNotifier([[]]);

  @override
  void initState() {
    super.initState();
    widget._controller.addOnClearListener(() {
      setState(() {
        _lines.value = [[]];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _lines.value.add([]);
      },
      onPanUpdate: (details) {
        setState(() {
          _lines.value.last.add(details.localPosition);
        });
      },
      child: CustomPaint(
        painter: SignaturePainter(lines: _lines.value),
        child: Container(),
      ),
    );
  }

  Future<ui.Image> get rendered {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    SignaturePainter painter = SignaturePainter(lines: _lines.value);
    var size = context.size ?? const Size(0, 0);
    painter.paint(canvas, size);
    return recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());
  }
}

class SignaturePainter extends CustomPainter {
  final List<List<Offset>> _lines;
  final Color _backgroundColor;

  SignaturePainter({
    required List<List<Offset>> lines,
    Color backgroundColor = Colors.transparent,
  })  : _lines = lines,
        _backgroundColor = backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 5;

    canvas.drawPaint(Paint()..color = _backgroundColor);

    if (_lines.isNotEmpty) {
      for (final points in _lines) {
        final path = Path();
        if (points.isEmpty) {
          continue;
        }
        path.moveTo(points.first.dx, points.first.dy);
        for (Offset point in points) {
          path.lineTo(point.dx, point.dy);
        }
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
