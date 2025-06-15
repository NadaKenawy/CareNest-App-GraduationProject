import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/routing/app_router.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingAppBar(showBackButton: false),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.all(16.0).copyWith(top: 0),
              children: [
                _buildSettingItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'FAQs',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kFaqScreen);
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: Icons.support_agent,
                  title: 'Support Contact',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSupportContactScreen);
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: Icons.people_outline,
                  title: 'Feedbacks',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kChangePasswordScreen);
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  context,
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {},
                  iconColor: Colors.red,
                  textColor: Colors.red,
                ),
                const Divider(color: Colors.red, thickness: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      leading: Icon(icon, color: iconColor ?? Colors.black, size: 24),
      title: Text(title,
          style: TextStyles.font16BlackMedium
              .copyWith(color: textColor ?? Colors.black)),
      trailing: Icon(Icons.arrow_forward_ios,
          color: iconColor ?? Colors.black, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey[200], thickness: 1);
  }
}
