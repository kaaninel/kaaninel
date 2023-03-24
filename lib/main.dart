import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaaninel/pages/entry.dart';
import 'package:kaaninel/pages/info.dart';
import 'package:kaaninel/pages/intro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

const primaryColor = Color.fromARGB(255, 255, 122, 13);
const scaffoldBackground = Color.fromARGB(200, 58, 58, 58);

class _MainAppState extends State<MainApp> {
  int currentPage = 0;

  static const pages = [
    Entry(),
    Intro(),
    Info(),
  ];
  static final theme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    background: scaffoldBackground,
  ));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: scaffoldBackground,
            body: Center(
              child: Builder(builder: grid),
            )));
  }

  Widget grid(context) {
    final diff = MediaQuery.of(context).size.width - 320 - 64;
    final padding = max<double>(min(diff, 64), 0);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Wrap(
            spacing: padding,
            runSpacing: padding,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: pages),
      ),
    );
  }
}
