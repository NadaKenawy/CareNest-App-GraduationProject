import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';

class CommunityMembersSearchField extends StatelessWidget {
  const CommunityMembersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle:
            TextStyles.font16BlackMedium.copyWith(color: Colors.grey[500]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
