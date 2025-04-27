import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';

class CommunityMemberTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const CommunityMemberTile({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imageUrl),
              ),
              if (isOnline)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Text(name, style: TextStyles.font16BlackMedium),
        ],
      ),
    );
  }
}
