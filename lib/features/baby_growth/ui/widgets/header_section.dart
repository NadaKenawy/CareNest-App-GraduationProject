import 'package:care_nest/features/baby_growth/ui/widgets/babies_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class HeaderSection extends StatelessWidget {
  final String selectedBaby;
  final String selectedImage;
  final List<Map<String, String>> babies;
  final Function(String, String) onBabySelected;

  const HeaderSection({
    super.key,
    required this.selectedBaby,
    required this.selectedImage,
    required this.babies,
    required this.onBabySelected,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 56),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => GoRouter.of(context).pop(),
            ),
            const SizedBox(width: 8),
            Text(
              'Watch $selectedBaby\'s\nAmazing Growth!',
              style:  TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            const Spacer(),
            BabiesDropdown(
              selectedImage: selectedImage,
              babies: babies,
              onBabySelected: onBabySelected,
            ),
          ],
        ),
      ),
    );
  }
}
