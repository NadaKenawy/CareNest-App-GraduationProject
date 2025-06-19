import 'package:flutter/material.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';

Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        "Log Out",
        style: TextStyles.font24PrimaryBlueSemiBold.copyWith(
          color: ColorsManager.darkBlue,
        ),
      ),
      content: Text(
        "Are you sure you want to log out?",
        style:
            TextStyles.font16BlackMedium.copyWith(fontWeight: FontWeight.w300),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            "Cancel",
            style: TextStyles.font16BlackMedium,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            "Log Out",
            style: TextStyles.font16BlackMedium.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    ),
  );
}
