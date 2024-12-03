import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:care_nest/features/home/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:care_nest/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userName});
  final String userName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserName = prefs.getString('userName');
    if (storedUserName != null && storedUserName.isNotEmpty) {
      setState(() {
        userName = storedUserName;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (userName == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(onTap: _onItemTapped),
      backgroundColor: Colors.white,
      body: HomeScreenBody(
        userName: userName!,
      ),
    );
  }
}
