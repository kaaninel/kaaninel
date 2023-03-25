import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kaaninel/common.dart';
import 'package:url_launcher/url_launcher.dart';

const textStyle =
    TextStyle(color: Colors.white54, fontSize: 32, height: 48 / 32);

String vcard() => """BEGIN:VCARD
VERSION:4.0
N:Inel;Kaan;;Mr.;
FN:Kaan Inel
ORG:kaaninel.dev
TITLE:Software Architect
PHOTO;MEDIATYPE#image/gif:https://kaaninel.dev/assets/l1.jpg
TEL;TYPE#work,voice;VALUE#uri:tel:+905343688084
ADR;TYPE#HOME;LABEL#"Güzelyalı/Atakum/Samsun":;;Adnan Menderes Blv.;Atakum;Samsun;55270;Turkey
EMAIL:kaaninel@gmail.com
REV:20230424T195243Z
x-qq:21588891
END:VCARD""";

class Info extends StatelessWidget {
  const Info({super.key});

  static Uri mailTo(String addr, String subject, String body) => Uri(
      scheme: "mailto",
      path: addr,
      queryParameters: {"subject": subject, "body": body});

  static Uri tel(String addr) => Uri(scheme: "tel", path: addr);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(children: [
      const SizedBox(
          width: double.infinity,
          child: Text("Contact with me",
              style: textStyle, textAlign: TextAlign.start)),
      InfoItem("Send an email", "kaaninel@gmail.com",
          mailTo("kaaninel@gmail.com", "Mail from kaaninel.dev", "Hi, ")),
      InfoItem(
          "Call, SMS or Whatsapp", "+90 (534) 368 80 84", tel("+905343688084")),
      InfoItem("Meet up", "Atakum / Samsun, Turkey",
          Uri.https("goo.gl", "/maps/1FoDBQtxmpk532Tv9")),
      InfoItem(
          "Read", "github.com/kaaninel", Uri.https("github.com", "/kaaninel")),
      InfoItem("Connect", "linkedin.com/in/kaaninel",
          Uri.https("linkedin.com", "/in/kaaninel")),
      GestureDetector(
          onTap: () => launchUrl(Uri.dataFromString(vcard(),
              mimeType: "text/vcard", encoding: utf8, base64: true)),
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
  final Uri uri;
  const InfoItem(this.title, this.value, this.uri, {super.key});

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
        const SizedBox(height: 4),
        InkWell(
          onTap: () => launchUrl(uri),
          child: SizedBox(
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
        ),
      ],
    );
  }
}
