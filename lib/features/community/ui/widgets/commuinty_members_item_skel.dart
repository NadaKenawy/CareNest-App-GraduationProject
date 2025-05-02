import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommuintyMembersItemSkel extends StatelessWidget {
  const CommuintyMembersItemSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                ),
                // Positioned(
                //   bottom: 2,
                //   right: 2,
                //   child: Container(
                //     width: 10,
                //     height: 10,
                //     decoration: BoxDecoration(
                //       color: Colors.green,
                //       shape: BoxShape.circle,
                //       border: Border.all(color: Colors.white, width: 2),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
              width: 120,
              height: 16,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
