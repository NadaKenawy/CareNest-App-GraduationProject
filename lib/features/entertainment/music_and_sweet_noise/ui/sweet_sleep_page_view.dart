import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/sweet_sleep_page_two.dart';
import 'sweet_sleep_screen_body.dart';

class SweetSleepPageView extends StatefulWidget {
  const SweetSleepPageView({super.key});

  @override
  State<SweetSleepPageView> createState() => _SweetSleepPageViewState();
}

class _SweetSleepPageViewState extends State<SweetSleepPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              SweetSleepBody(),
              SweetSleepPageTwo(),
            ],
          ),
          Positioned(
            top: 110.h,
            left: 185.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIndicator(isActive: _currentPage == 0),
                SizedBox(width: 10.w),
                _buildIndicator(isActive: _currentPage == 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator({required bool isActive}) {
    return Container(
      height: 15.h,
      width: 15.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
