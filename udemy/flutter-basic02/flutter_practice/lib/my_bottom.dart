import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NavItem {
  final IconData activeIcon;
  final String label;

  NavItem({required this.activeIcon, required this.label});
}

final navItem = [
  NavItem(activeIcon: Icons.home, label: "홈"),
  NavItem(activeIcon: Icons.group, label: "그룹"),
  NavItem(activeIcon: Icons.chat_outlined, label: "채팅"),
  NavItem(activeIcon: Icons.settings_ethernet, label: "설정"),
];
