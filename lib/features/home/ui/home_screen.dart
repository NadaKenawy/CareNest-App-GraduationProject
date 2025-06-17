import 'package:care_nest/features/add_baby/ui/my_babies_screen.dart';
import 'package:care_nest/features/chat_bot/ui/chat_bot_screen.dart';
import 'package:care_nest/features/profile/ui/profile_screen.dart';
import 'package:care_nest/features/setting/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/features/home/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:care_nest/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenBody(),
    const ChatBotScreen(),
    const MyBabiesScreen(),
    const ProfileScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_pageIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
