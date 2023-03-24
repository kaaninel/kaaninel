import 'package:flutter/material.dart';
import 'package:kaaninel/logo.dart';

class PageScaffold extends StatelessWidget {
  final List<Widget> children;
  final bool? lastOfSeq;
  const PageScaffold({super.key, required this.children, this.lastOfSeq});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 568,
      child: Material(
        color: const Color(0xFF3A3A3A),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...children,
              if (lastOfSeq == true) const Logo(size: 64),
              if (lastOfSeq == false) const Icon(Icons.arrow_downward, size: 64)
            ],
          ),
        ),
      ),
    );
  }
}
