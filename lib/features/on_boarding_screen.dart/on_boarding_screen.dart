// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:developer';

import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen1.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen2.dart';
import 'package:care_nest/features/on_boarding_screen.dart/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theme/text_styless.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // _checkFirstTimeOpen();
  }

  // Future<void> _checkFirstTimeOpen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? hasOpenedBefore = prefs.getBool('hasOpenedBefore');

  //   if (hasOpenedBefore != null && hasOpenedBefore) {
  //     GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
  //   } else {
  //     await prefs.setBool('hasOpenedBefore', true);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    log("Skip button pressed");
                    GoRouter.of(context).push(AppRouter.kLoginScreen);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyles.font20SecondaryBlueMedium,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
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
                    bottom: 0,
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
                            activeDotColor: ColorsManager.primaryPinkColor,
                            dotColor: ColorsManager.secondryBlueColor,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_currentIndex > 0)
                                TextButton(
                                  onPressed: () {
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    'Back',
                                    style: TextStyles.font20SecondaryBlueMedium,
                                  ),
                                )
                              else
                                const SizedBox(),
                              _buildNextButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 150.w,
          height: 100.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryPinkColor.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 15,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryPinkColor.withOpacity(0.50),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryPinkColor.withOpacity(0.75),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 45,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryPinkColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _currentIndex == 2 ? Icons.check : Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_currentIndex < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kLoginScreen);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
