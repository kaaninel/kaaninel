import 'package:flutter/material.dart';
import 'package:kaaninel/common.dart';

const textStyle =
    TextStyle(color: Colors.white54, fontSize: 36, height: 54 / 36);
const itemStyle = TextStyle(
    color: Color.fromARGB(217, 255, 255, 255), fontSize: 24, height: 36 / 24);

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(lastOfSeq: true, children: [
      SizedBox(
        width: double.infinity,
        child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(text: "Hello, I’m ", style: textStyle, children: [
              TextSpan(
                  text: "Kaan",
                  style: TextStyle(color: Theme.of(context).primaryColor))
            ])),
      ),
      const SizedBox(
          width: double.infinity,
          child: Text("& I’m a", style: textStyle, textAlign: TextAlign.start)),
      const IntroItem("Software Architect,"),
      const IntroItem("Consultant,"),
      const IntroItem("Developer,"),
      const IntroItem("& Chaos Coordinator"),
    ]);
  }
}

class IntroItem extends StatelessWidget {
  final String text;
  const IntroItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Text(text, style: itemStyle, textAlign: TextAlign.end));
  }
}
