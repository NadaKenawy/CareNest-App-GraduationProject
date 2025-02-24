import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FunVideoScreenBody extends StatefulWidget {
  const FunVideoScreenBody({super.key});

  @override
  State<FunVideoScreenBody> createState() => _FunVideoScreenBodyState();
}

class _FunVideoScreenBodyState extends State<FunVideoScreenBody> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'channal': 'assets/images/channels4_profile (1).jpg',
      'videos': [
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Bath Song | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Bath Song | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720 (1).jpg',
          'title': 'Bath Song | @CoComelon Nursery Rhymes & Kids Songs'
        },
      ],
    },
    {
      'channal': 'assets/images/channels4_profile (2).jpg',
      'videos': [
        {
          'image': 'assets/images/hq720 (2).jpg',
          'title': 'Twinkle Twinkle Little Star | @CoComelon'
        },
        {
          'image': 'assets/images/hq720 (2).jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
      ],
    },
    {
      'channal': 'assets/images/channels4_profile (3).jpg',
      'videos': [
        {'image': 'assets/images/hq720 (3).jpg', 'title': 'Some Song #1'},
        {'image': 'assets/images/hq720 (3).jpg', 'title': 'Some Song #2'},
      ],
    },
    {
      'channal': 'assets/images/channels4_profile (4).jpg',
      'videos': [
        {
          'image': 'assets/images/hq720.jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
        {
          'image': 'assets/images/hq720.jpg',
          'title': 'Bath Song | @CoComelon Nursery Rhymes & Kids Songs'
        },
      ],
    },
    {
      'channal': 'assets/images/Cocomelon.webp',
      'videos': [
        {
          'image': 'assets/images/maxresdefault (1).jpg',
          'title': 'Twinkle Twinkle Little Star | @CoComelon'
        },
        {
          'image': 'assets/images/maxresdefault (1).jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
      ],
    },
    {
      'channal': 'assets/images/channels4_profile.jpg',
      'videos': [
        {
          'image': 'assets/images/maxresdefault.jpg',
          'title': 'Twinkle Twinkle Little Star | @CoComelon'
        },
        {
          'image': 'assets/images/maxresdefault.jpg',
          'title': 'Wheels on the Bus | @CoComelon Nursery Rhymes & Kids Songs'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Short Stories',
                      style: TextStyles.font20BlackSemiBold,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 85.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: 12.w),
                          width: isSelected ? 85.w : 70.w,
                          height: isSelected ? 85.h : 70.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? ColorsManager.secondryBlueColor
                                  : Colors.white,
                              width: 4.w,
                            ),
                            image: DecorationImage(
                              image: AssetImage(categories[index]['channal']),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories[selectedIndex]['videos'].length,
                    itemBuilder: (context, index) {
                      final video = categories[selectedIndex]['videos'][index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(
                                video['image'],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              video['title'],
                              style: TextStyles.font20BlackSemiBold,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
