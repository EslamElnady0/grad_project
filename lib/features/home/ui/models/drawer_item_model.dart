import 'package:flutter/material.dart';

class DrawerItemModel {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  DrawerItemModel(
      {required this.iconPath, required this.title, required this.onTap});
}
