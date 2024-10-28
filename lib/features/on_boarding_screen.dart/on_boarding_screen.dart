import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen1.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen2.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 12.0,
                    dotWidth: 12.0,
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                _buildNextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        if (_currentIndex < 2) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          GoRouter.of(context).push(AppRouter.kHomeScreen);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(_currentIndex == 2 ? "Get Started" : "Next"),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
