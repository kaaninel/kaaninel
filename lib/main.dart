import 'package:flutter/material.dart';
import 'package:kaaninel/entry.dart';
import 'package:kaaninel/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPage = 0;

  final pages = const [Entry(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 122, 13),
              primary: const Color.fromARGB(255, 255, 122, 13),
              background: const Color(0xFF3A3A3A))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(children: [
        PageView(
            onPageChanged: (value) => setState(() => currentPage = value),
            scrollDirection: Axis.vertical,
            children: pages),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < pages.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: currentPage == i ? Colors.white70 : Colors.white12,
                ),
              ),
            )
        ])
      ])),
    );
  }
}
