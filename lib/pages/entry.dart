import 'package:flutter/material.dart';
import 'package:kaaninel/common.dart';
import 'package:kaaninel/logo.dart';

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(children: [
      const LogoAnimated(size: 164),
      Image.asset("assets/qr.png", height: 164, width: 164)
    ]);
  }
}
