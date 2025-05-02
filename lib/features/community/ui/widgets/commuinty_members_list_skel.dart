import 'package:flutter/material.dart';

import 'commuinty_members_item_skel.dart';

class CommuintyMembersListSkel extends StatelessWidget {
  const CommuintyMembersListSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return const CommuintyMembersItemSkel();
      },
    );
  }
}
