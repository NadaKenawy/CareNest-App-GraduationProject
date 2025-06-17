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
      title: Row(
        children: [
          const Icon(Icons.logout, color: Colors.red, size: 28),
          const SizedBox(width: 8),
          Text(
            "Log Out",
            style: TextStyles.font24PrimaryBlueSemiBold.copyWith(
              color: ColorsManager.darkBlue,
            ),
          ),
        ],
      ),
      content: const Text(
        "Are you sure you want to log out?",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: ColorsManager.darkBlue,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(
            "Log Out",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.red,
            ),
          ),
        ),
      ],
    ),
  );
}
