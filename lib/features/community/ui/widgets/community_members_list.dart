import 'package:flutter/material.dart';
import 'community_member_tile.dart';

// بيانات تجريبية
final List<Map<String, dynamic>> members = [
  {
    "name": "Nada Kenawy",
    "image": "assets/images/download.jpg",
    "isOnline": true,
  },
  {
    "name": "Esraa Abdelnasser",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
  {
    "name": "Menna Zakaria",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
  {
    "name": "Menna Omar",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
  {
    "name": "Nouran Nouh",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
  {
    "name": "Mayada Mohy",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
  {
    "name": "Habeba Abdallah",
    "image": "assets/images/download.jpg",
    "isOnline": false,
  },
];

class CommunityMembersList extends StatelessWidget {
  const CommunityMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: members.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final member = members[index];
        return CommunityMemberTile(
          name: member["name"],
          imageUrl: member["image"],
          isOnline: member["isOnline"],
        );
      },
    );
  }
}
