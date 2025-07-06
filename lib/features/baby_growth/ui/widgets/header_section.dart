import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/babies_dropdown.dart';

class HeaderSection extends StatelessWidget {
  final String selectedBaby;
  final String selectedImage;
  final String babyId;
  final Function(String, String, String) onBabySelected;

  const HeaderSection({
    super.key,
    required this.selectedBaby,
    required this.selectedImage,
    required this.onBabySelected,
    required this.babyId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background2.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 56.h),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 8.w),
            Text(
              selectedBaby.isNotEmpty
                  ? 'Watch ${selectedBaby[0].toUpperCase()}${selectedBaby.substring(1)}\'s\nAmazing Growth!'
                  : 'Watch Your Baby\'s\nAmazing Growth!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            BabyDropdown(
              selectedImage: selectedImage,
              mode: BabyDropdownMode.precomputedImage,
              onSelected: (id, name, image, [index]) {
                onBabySelected(id, name, image);
              },
            ),
          ],
        ),
      ),
    );
  }
}
