// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unused_field, prefer_final_fields, deprecated_member_use

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
import '../../core/helpers/constants.dart';
import '../../core/helpers/shared_pref_helper.dart';
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
    _checkFirstTimeOpen();
  }

  Future<void> _checkFirstTimeOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasOpenedBefore = prefs.getBool('hasOpenedBefore');

    if (hasOpenedBefore != null && hasOpenedBefore) {
      String? token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

      if (token != null && token.isNotEmpty) {
        GoRouter.of(context)
            .pushReplacement(AppRouter.kHomeScreen, extra: token);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
      }
    } else {
      await prefs.setBool('hasOpenedBefore', true);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: WormEffect(
                            dotHeight: 12.r,
                            dotWidth: 12.r,
                            activeDotColor: ColorsManager.primaryPinkColor,
                            dotColor: ColorsManager.secondryBlueColor,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 150.w,
        height: 100.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0.w,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorsManager.primaryPinkColor.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 15.w,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorsManager.primaryPinkColor.withOpacity(0.50),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 30.w,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: ColorsManager.primaryPinkColor.withOpacity(0.75),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 45.w,
              child: Container(
                width: 60.w,
                height: 60.h,
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
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
