import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/community/ui/widgets/community_app_bar.dart';
import 'package:flutter/material.dart';
import 'community_members_search_field.dart';
import 'community_members_list.dart';

class CommunityMembersScreen extends StatelessWidget {
  const CommunityMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommunityAppBar(
            showGroupIcon: false,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CommunityMembersSearchField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child:
                Text("Community Members", style: TextStyles.font16BlackMedium),
          ),
          const Expanded(
            child: CommunityMembersList(),
          ),
        ],
      ),
    );
  }
}
