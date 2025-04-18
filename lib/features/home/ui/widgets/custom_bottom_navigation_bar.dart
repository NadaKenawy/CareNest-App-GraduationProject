// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const CustomBottomNavigationBar(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: CurvedNavigationBar(
        index: currentIndex,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: Colors.white,
        color: ColorsManager.primaryPinkColor,
        items: const <Widget>[
          FaIcon(
            Icons.home,
            size: 28,
            color: Colors.white,
          ),
          FaIcon(
            Icons.chat,
            size: 28,
            color: Colors.white,
          ),
          ImageIcon(
            AssetImage("assets/images/baby (1).png"),
            size: 28,
            color: Colors.white,
          ),
          FaIcon(
            Icons.settings,
            size: 28,
            color: Colors.white,
          ),
          FaIcon(
            Icons.person,
            size: 28,
            color: Colors.white,
          ),
        ],
        onTap: onTap,
      ),
    );
  }
}
