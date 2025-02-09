import 'package:care_nest/features/baby_growth/ui/widgets/babies_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              'Watch ${selectedBaby[0].toUpperCase()}${selectedBaby.substring(1)}\'s\nAmazing Growth!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            BabiesDropdown(
              selectedImage: selectedImage,
              onBabySelected: (id, name, image) {
                onBabySelected(id, name, image);
              },
            ),
          ],
        ),
      ),
    );
  }
}
