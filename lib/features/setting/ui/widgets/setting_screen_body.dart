import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_item.dart';
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
                SettingItem(
                  icon: Icons.help_outline,
                  title: 'FAQs',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kFaqScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.support_agent,
                  title: 'Support Contact',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSupportContactScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.people_outline,
                  title: 'Feedbacks',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kFeedbackScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kChangePasswordScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    // Handle logout
                  },
                ),
                const Divider(color: Colors.red, thickness: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
