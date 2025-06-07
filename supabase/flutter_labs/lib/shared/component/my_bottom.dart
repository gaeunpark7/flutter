import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NavItem {
  final IconData activeIcon;
  final String label;

  const NavItem({required this.activeIcon, required this.label});

  get iconData => null;
}

final navItems = [
  NavItem(activeIcon: Icons.home, label: '홈'),
  NavItem(activeIcon: Icons.group, label: '그룹'),
  NavItem(activeIcon: Icons.chat, label: '채팅'),
  NavItem(activeIcon: Icons.my_library_add, label: '마이페이지'),
];
