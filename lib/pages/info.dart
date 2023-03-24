import 'package:flutter/material.dart';
import 'package:kaaninel/common.dart';

const textStyle =
    TextStyle(color: Colors.white54, fontSize: 32, height: 48 / 32);

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(children: [
      const SizedBox(
          width: double.infinity,
          child: Text("Contact with me",
              style: textStyle, textAlign: TextAlign.start)),
      const InfoItem("Send an email", "kaaninel@gmail.com"),
      const InfoItem("Call, SMS or Whatsapp", "+90 (534) 368 80 84"),
      const InfoItem("Meet up", "Atakum / Samsun, Turkey"),
      const InfoItem("Read", "github.com/kaaninel"),
      const InfoItem("Connect", "linkedin.com/in/kaaninel"),
      GestureDetector(
          onTap: () {},
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white10,
            child: SizedBox.square(
              dimension: 48,
              child: Icon(Icons.add,
                  size: 36, color: Theme.of(context).primaryColor),
            ),
          ))
    ]);
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  const InfoItem(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 18,
                height: 27 / 18,
              ),
            )),
        SizedBox(
            width: double.infinity,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontSize: 18,
                height: 27 / 18,
              ),
            )),
      ],
    );
  }
}
