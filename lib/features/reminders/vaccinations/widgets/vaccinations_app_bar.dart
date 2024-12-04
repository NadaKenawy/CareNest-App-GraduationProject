// lib/widgets/app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';

class VaccinationsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? selectedBabyName;
  final Function openDrawerCallback;

  const VaccinationsAppBar({super.key, required this.selectedBabyName, required this.openDrawerCallback});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        selectedBabyName?.isNotEmpty == true
            ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Vaccinations"
            : 'My Vaccinations',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, size: 24.sp, color: Colors.black),
              onPressed: () => openDrawerCallback(),
            );
          },
        ),
      ],
    );
  }
}
