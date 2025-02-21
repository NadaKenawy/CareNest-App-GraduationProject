import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyTipsSkeleton extends StatelessWidget {
  const BabyTipsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  childAspectRatio: .75,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey[300]!, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 182.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          height: 16.h,
                          width: 100.w,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
