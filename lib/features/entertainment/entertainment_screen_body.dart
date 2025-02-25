// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EntertainmentScreenBody extends StatelessWidget {
  const EntertainmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entertainment",
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth = (constraints.maxWidth - 52.w) / 2;
          double cardHeight = cardWidth;
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedCategoryCard(
                      svgPath: "assets/images/StoriesIcon.svg",
                      title: "Short Stories",
                      route: AppRouter.kShortStoriesScreen,
                      cardWidth: cardWidth,
                      cardHeight: cardHeight,
                    ),
                    SizedBox(height: 16.h),
                    AnimatedCategoryCard(
                      svgPath: "assets/images/lullabyIcon.svg",
                      title: "Sweet Sleep",
                      route: AppRouter.kSweetSleep,
                      cardWidth: cardWidth,
                      cardHeight: cardHeight,
                    ),
                    SizedBox(height: 16.h),
                    AnimatedCategoryCard(
                      svgPath: "assets/images/Play-VideosIcon.svg",
                      title: "Fun Videos",
                      route: AppRouter.kFunVideosScreen,
                      cardWidth: cardWidth,
                      cardHeight: cardHeight,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedCategoryCard extends StatefulWidget {
  final String svgPath;
  final String title;
  final String route;
  final double cardWidth;
  final double cardHeight;

  const AnimatedCategoryCard({
    super.key,
    required this.svgPath,
    required this.title,
    required this.route,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  State<AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<AnimatedCategoryCard> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.w),
          splashColor: ColorsManager.primaryPinkColor.withOpacity(0.4),
          onHighlightChanged: (isHighlighted) {
            setState(() {
              scale = isHighlighted ? 0.95 : 1.0;
            });
          },
          onTap: () {
            if (widget.route.isNotEmpty) {
              GoRouter.of(context).push(widget.route);
            }
          },
          child: Container(
            width: widget.cardWidth,
            height: widget.cardHeight,
            decoration: BoxDecoration(
              color: ColorsManager.primaryPinkColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.svgPath,
                  width: widget.cardWidth * 0.5,
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.semiBold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
