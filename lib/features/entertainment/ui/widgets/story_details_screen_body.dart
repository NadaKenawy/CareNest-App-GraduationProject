import 'package:care_nest/features/entertainment/data/models/get_all_stories/get_all_stories_response.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StoryDetailsScreenBody extends StatelessWidget {
  final StoryData story;
  const StoryDetailsScreenBody({super.key, required this.story});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                      child: story.image != null
                          ? Image.network(
                              story.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      'assets/images/The Sleepy Little Kitten.jpeg',
                                      fit: BoxFit.cover),
                            )
                          : Image.asset(
                              'assets/images/The Sleepy Little Kitten.jpeg',
                              fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 56.h,
                    left: 8.w,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(52.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        story.title ?? '',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      story.content ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
