import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportContactScreen extends StatelessWidget {
  const SupportContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SettingAppBar(title: 'Support Contact'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'If you need any help or have any questions, feel free to contact our support team.',
                      style: TextStyles.font16PrimaryBlueMedium
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    buildSupportCard(),
                    const SizedBox(height: 24),
                    buildSocialMediaCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSupportCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Support', style: TextStyles.font16BlackMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.phone, color: ColorsManager.primaryBlueColor),
              const SizedBox(width: 8),
              Text('Contact Number',
                  style: TextStyles.font16BlackMedium
                      .copyWith(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(width: 8),
              Text('+123-456-7890',
                  style: TextStyles.font16BlackMedium.copyWith(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.email_outlined,
                  color: ColorsManager.primaryBlueColor),
              const SizedBox(width: 8),
              Text('Email Address',
                  style: TextStyles.font16BlackMedium
                      .copyWith(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(width: 8),
              Flexible(
                  child: Text('support@yourapp.com',
                      style:
                          TextStyles.font16BlackMedium.copyWith(fontSize: 14)))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSocialMediaCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Media', style: TextStyles.font16BlackMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.twitter,
                color: ColorsManager.thirdryBlueColor,
              ),
              const SizedBox(width: 8),
              Text('Twitter',
                  style: TextStyles.font16BlackMedium
                      .copyWith(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(width: 8),
              Text('twitter@yourapp.com',
                  style: TextStyles.font16BlackMedium.copyWith(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.facebook, color: ColorsManager.primaryBlueColor),
              const SizedBox(width: 8),
              Text('Facebook',
                  style: TextStyles.font16BlackMedium
                      .copyWith(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(width: 8),
              Text('facebook@yourapp.com',
                  style: TextStyles.font16BlackMedium.copyWith(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(FontAwesomeIcons.instagram,
                  color: ColorsManager.secondryPinkColor),
              const SizedBox(width: 8),
              Text('Instagram',
                  style: TextStyles.font16BlackMedium
                      .copyWith(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(width: 8),
              Text('instagram@yourapp.com',
                  style: TextStyles.font16BlackMedium.copyWith(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
