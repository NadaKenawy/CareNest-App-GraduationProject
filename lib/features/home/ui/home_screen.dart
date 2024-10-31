// ignore_for_file: library_private_types_in_public_api

import 'package:care_nest/features/home/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:care_nest/features/home/ui/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userName});
  final String userName;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(onTap: _onItemTapped),
      backgroundColor: Colors.white,
      body: HomeScreenBody(
        userName: widget.userName,
      ),
    );
  }
}
