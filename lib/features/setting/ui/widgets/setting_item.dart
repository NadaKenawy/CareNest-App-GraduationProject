import 'package:flutter/material.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      leading: Icon(icon, color: iconColor ?? Colors.black, size: 24),
      title: Text(
        title,
        style: TextStyles.font16BlackMedium
            .copyWith(color: textColor ?? Colors.black),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: iconColor ?? Colors.black,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
