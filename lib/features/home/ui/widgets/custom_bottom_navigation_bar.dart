// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.onTap});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: CurvedNavigationBar(
        index: _pageIndex,
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
            AssetImage("assets/icons/baby-boy.png"),
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
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          widget.onTap(index);
        },
      ),
    );
  }
}
