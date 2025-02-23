import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShortStoriesScreenBody extends StatelessWidget {
  const ShortStoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {
        'image': 'assets/images/The Sleepy Forest.jpeg',
        'title': 'The Sleepy Forest'
      },
      {
        'image': 'assets/images/The Sleepy Little Kitten.jpeg',
        'title': 'The Sleepy Little Kitten'
      },
      {
        'image': 'assets/images/The Sleepy Little Train.jpeg',
        'title': 'The Sleepy Little Train'
      },
      {
        'image': 'assets/images/The Teddy Bear’s Secret.jpeg',
        'title': 'The Teddy Bear’s Secret'
      },
      {
        'image': 'assets/images/The Sleepy Forest.jpeg',
        'title': 'The Sleepy Forest'
      },
      {
        'image': 'assets/images/The Sleepy Little Kitten.jpeg',
        'title': 'The Sleepy Little Kitten'
      },
      {
        'image': 'assets/images/The Sleepy Little Train.jpeg',
        'title': 'The Sleepy Little Train'
      },
      {
        'image': 'assets/images/The Teddy Bear’s Secret.jpeg',
        'title': 'The Teddy Bear’s Secret'
      },
      {
        'image': 'assets/images/The Sleepy Forest.jpeg',
        'title': 'The Sleepy Forest'
      },
      {
        'image': 'assets/images/The Sleepy Little Kitten.jpeg',
        'title': 'The Sleepy Little Kitten'
      },
      {
        'image': 'assets/images/The Sleepy Little Train.jpeg',
        'title': 'The Sleepy Little Train'
      },
      {
        'image': 'assets/images/The Teddy Bear’s Secret.jpeg',
        'title': 'The Teddy Bear’s Secret'
      },
      {
        'image': 'assets/images/The Sleepy Forest.jpeg',
        'title': 'The Sleepy Forest'
      },
      {
        'image': 'assets/images/The Sleepy Little Kitten.jpeg',
        'title': 'The Sleepy Little Kitten'
      },
      {
        'image': 'assets/images/The Sleepy Little Train.jpeg',
        'title': 'The Sleepy Little Train'
      },
      {
        'image': 'assets/images/The Teddy Bear’s Secret.jpeg',
        'title': 'The Teddy Bear’s Secret'
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, bottom: 16.h, top: 8.h),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    children: stories.map((story) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kStoryDetailsScreen);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Stack(
                              children: [
                                Image.asset(
                                  story['image']!,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 4.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          story['title']!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight:
                                                FontWeightHelper.semiBold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
