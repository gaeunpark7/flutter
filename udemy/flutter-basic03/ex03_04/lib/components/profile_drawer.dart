import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.66,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            CircleAvatar(
                radius: 70, //크기
                backgroundImage: AssetImage("assets/images/곰9.jpeg")),
            Text("Damgom"),
            Divider(color: Colors.black),
            Text("Damgom"),
            Text("Damgom"),
            Text("Damgom"),
            Text("Damgom"),
            Text("Damgom"),
          ],
        ),
      ),
    );
  }
}
