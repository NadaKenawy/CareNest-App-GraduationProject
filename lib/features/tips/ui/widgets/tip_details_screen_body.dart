import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TipDetailsScreenBody extends StatelessWidget {
  const TipDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/getimg_ai_img-hA6pbEpwT1cadtyJzT7U4.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 56,
                  left: 16,
                  child: InkWell(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text(
                'Overcoming Postpartum Depression 💖',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: const Text(
                'Congratulations on your new arrival! 😊 While the joy of motherhood is immense, it\'s normal to feel overwhelmed sometimes. Here are five concise tips to help you navigate postpartum depression:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  tipItem(
                    '1. Seek Professional Support',
                    'Reach out to a mental health professional or counselor. Getting expert guidance can provide you with effective strategies tailored to your needs.',
                  ),
                  tipItem(
                    '2. Build a Support Network',
                    'Share your feelings with friends, family, or support groups. Connecting with others who understand your experience can ease feelings of isolation.',
                  ),
                  tipItem(
                    '3. Prioritize Self-Care',
                    'Remember, taking care of yourself is vital. Aim for rest, eat balanced meals, and give yourself time to recover—your well-being is key to caring for your baby.',
                  ),
                  tipItem(
                    '4. Practice Relaxation Techniques',
                    'Incorporate deep breathing, meditation, or gentle exercise into your routine. These practices can help reduce stress and improve your mood.',
                  ),
                  tipItem(
                    '5. Celebrate Small Victories',
                    'Acknowledge every little step forward. Recognizing small improvements can boost your confidence and reinforce your progress.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 8.h, bottom: 20.h),
              child: const Text(
                'Every mother\'s journey is unique. Be patient with yourself, and remember that seeking help is a sign of strength. Your well-being is the foundation for a brighter future for both you and your baby. 💖',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tipItem(String title, String description) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
