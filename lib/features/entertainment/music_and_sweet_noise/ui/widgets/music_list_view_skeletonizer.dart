import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MusicListViewSkeletonizer extends StatelessWidget {
  const MusicListViewSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Skeletonizer(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  height: 115.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xffebebf4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Row(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 223, 223, 231),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Container(
                              height: 20,
                              width: 80,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 223, 223, 231),
                                shape: BoxShape.rectangle,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Container(
                              width: 280.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 223, 223, 231),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 223, 223, 231),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
