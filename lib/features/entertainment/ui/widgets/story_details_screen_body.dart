import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class StoryDetailsScreenBody extends StatelessWidget {
  const StoryDetailsScreenBody({super.key});

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
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        'assets/images/The Teddy Bear’s Secret.jpeg',
                        fit: BoxFit.cover,
                      ),
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
                  borderRadius: BorderRadius.circular(60.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Center(
                      child: Text(
                        "The Teddy Bear’s Secret",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Lily had a very special teddy bear named Bruno. Every night, she hugged him tight before falling asleep.\n"
                      "One night, after Lily had drifted into dreams, Bruno wiggled his little arms and whispered to the other toys, 'Shh! It’s time for our secret mission. \n"
                      "All the toys gathered around.\n"
                      "We have to make sure Lily has the sweetest dreams! whispered Bruno.\n"
                      "The doll fluffed her pillow. The toy bunny tucked in her blanket. The wooden horse rocked gently, making soft music.\n"
                      "Bruno smiled. 'Now everything is perfect!\n"
                      "The toys returned to their spots just as the morning light peeked through the curtains.\n"
                      "When Lily woke up, she hugged Bruno. I had the best dream ever! she said.\n"
                      "Bruno smiled his little teddy bear smile, knowing their mission was complete.\n"
                      "Goodnight, Bruno. Goodnight, little dreamers.",
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
