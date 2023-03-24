import 'package:flutter/material.dart';
import 'package:kaaninel/logo.dart';

class Entry extends StatefulWidget {
  const Entry({
    super.key,
  });

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  bool initialAnimation = true;
  final Duration duration = const Duration(milliseconds: 500);
  bool hover = false;

  @override
  void initState() {
    super.initState();
    animate();
  }

  void animate() async {
    if (mounted) setState(() => initialAnimation = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => initialAnimation = false);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 640, minHeight: 300),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox.shrink(),
          SizedBox(
            height: 160,
            width: 640,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: animate,
                  child: MouseRegion(
                      onEnter: (e) => setState(() => hover = true),
                      onExit: (e) => setState(() => hover = false),
                      child: AnimatedSwitcher(
                          duration: Duration.zero,
                          child: hover
                              ? const LogoAnimated(size: 160)
                              : const Logo(size: 160))),
                ),
                AnimatedSize(
                  duration: duration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: !initialAnimation ? 16 : 0),
                    child: Material(
                      color: colors.primary,
                      child: SizedBox(
                          width: !initialAnimation ? 4 : 0, height: 160),
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: duration,
                  child: SizedBox(
                    width: !initialAnimation ? null : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Kaan Inel",
                          style: textTheme.displaySmall!
                              .apply(color: colors.primary),
                        ),
                        Text(
                          "Software Architect | Chaos Coordinator",
                          style: textTheme.headlineSmall!
                              .apply(color: colors.primary),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: initialAnimation ? 0 : 1,
            duration: duration,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_downward,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
      )),
    );
  }
}
