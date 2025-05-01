import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/default_user_image.dart';
import 'package:care_nest/features/community/data/models/get_online_users/get_online_users_response.dart';
import 'package:flutter/material.dart';

class CommunityMemberTile extends StatelessWidget {
  const CommunityMemberTile({
    super.key,
    required this.user,
  });
  final User user;
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
              user.image == null
                  ? const DefaultUserImg()
                  : CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(user.image!),
                    ),
              // if (isOnline)
              //   Positioned(
              //     bottom: 2,
              //     right: 2,
              //     child: Container(
              //       width: 10,
              //       height: 10,
              //       decoration: BoxDecoration(
              //         color: Colors.green,
              //         shape: BoxShape.circle,
              //         border: Border.all(color: Colors.white, width: 2),
              //       ),
              //     ),
              //   ),
            ],
          ),
          const SizedBox(width: 16),
          Text('${user.firstName} ${user.lastName}',
              style: TextStyles.font16BlackMedium),
        ],
      ),
    );
  }
}
