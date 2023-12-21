import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_animation/signature/signature.dart';
import 'dart:ui' as ui;
import 'package:share_plus/share_plus.dart';

class SignatureScreen extends StatefulWidget {
  static Route get route {
    return MaterialPageRoute(builder: (_) => const SignatureScreen());
  }

  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final GlobalKey<SignatureState> _signatureKey = GlobalKey();
  final SignatureController _controller = SignatureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Board'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton(
              onPressed: () => _shareSignature(context),
              child: const Text('輸出'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton(
              onPressed: () => _controller.clear(),
              child: const Text('清除'),
            ),
          )
        ],
      ),
      body: Signature(key: _signatureKey, controller: _controller),
    );
  }

  Future<ShareResult?> _shareSignature(BuildContext context) async {
    ui.Image? renderedImage = await _signatureKey.currentState?.rendered;
    if (renderedImage == null) {
      return null;
    }

    var byteData = await renderedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    if (byteData == null) {
      return null;
    }

    Uint8List pngBytes = byteData.buffer.asUint8List();

    return Share.shareXFiles([
      XFile.fromData(
        pngBytes,
        mimeType: '.png',
        name: 'my-signature',
      )
    ]);
  }
}
