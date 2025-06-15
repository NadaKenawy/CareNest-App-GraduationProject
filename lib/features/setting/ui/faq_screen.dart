import 'package:flutter/material.dart';
import 'package:care_nest/features/setting/ui/widgets/setting_app_bar.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': '1. What is this app about?',
      'answer':
          'This app helps mothers care for their newborn babies by understanding their needs, tracking their health, and providing useful tools and guidance.'
    },
    {
      'question': '2. How does the baby cry analyzer work?',
      'answer':
          'The app analyzes your baby\'s cry and identifies the reason from five types: (Hunger, Discomfort, Burping, Tiredness and belly pain)'
    },
    {
      'question': '3. Can I track my baby\'s daily health?',
      'answer':
          'Yes, you can monitor vaccinations, medications, and receive reminders to keep you updated.'
    },
    {
      'question': '4. How can I follow my baby\'s growth?',
      'answer':
          'You can easily record and track your baby\'s weekly weight and height updates.'
    },
    {
      'question': '5. Does the app provide sleep music and stories?',
      'answer':
          'Yes, we offer relaxing music, bedtime stories, and short videos to help your baby sleep peacefully.'
    },
    {
      'question': '6. Are there tips for mothers?',
      'answer':
          'Yes, we provide daily health and wellness tips to support mothers’ physical and mental well-being.'
    },
    {
      'question': '7. Can I find doctors and hospitals nearby?',
      'answer':
          'Yes, the app shows nearby pediatricians and children\'s hospitals, and you can book appointments directly through the app.'
    },
    {
      'question': '8. Is there a group chat for mothers?',
      'answer':
          'Yes, mothers can join a group chat to share experiences, advice, and support each other.'
    },
    {
      'question': '9. How can I ask quick questions?',
      'answer':
          'We have a smart chatbot available 24/7 to answer your questions and guide you.'
    },
    {
      'question': '10. Is the app free to use?',
      'answer':
          'Basic features are free. Some premium features may require a subscription (optional).'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SettingAppBar(title: 'FAQs'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                final item = faqData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        tilePadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        collapsedBackgroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        title: Text(
                          item['question']!,
                          style: TextStyles.font16BlackMedium,
                        ),
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, bottom: 12),
                            child: Text(
                              item['answer']!,
                              style: TextStyles.font16BlackMedium.copyWith(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
