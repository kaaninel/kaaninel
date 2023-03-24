import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_pin),
                    label: const Text("Samsun / Turkey")),
                const SizedBox(height: 8),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone_android),
                    label: const Text("+90 (534) 368 80 84")),
                const SizedBox(height: 8),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.mail),
                    label: const Text("kaaninel@gmail.com")),
              ],
            ),
          ),
          Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.hardEdge,
              child: Image.asset("assets/l1.jpg"))
        ]));
  }
}
