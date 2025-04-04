import 'package:ex03_04/components/profile_button.dart';
import 'package:ex03_04/components/profile_count.dart';
import 'package:ex03_04/components/profile_drawer.dart';
import 'package:ex03_04/components/profile_header.dart';
import 'package:ex03_04/components/profile_tabs.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const ProfileDrawer(),
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        title: const Text("damgom"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Divider(height: 1),
          SizedBox(height: 5),
          ProfileHeader(),
          SizedBox(height: 10),
          ProfileButton(),
          SizedBox(height: 10),
          Divider(),
          ProfileCount(),
          Divider(),
          Expanded(child: ProfileTabs())
        ],
      ),
    );
  }
}
