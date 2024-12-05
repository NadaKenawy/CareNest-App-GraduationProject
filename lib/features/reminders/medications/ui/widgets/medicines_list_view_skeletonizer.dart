// ignore_for_file: use_build_context_synchronously
import 'package:care_nest/features/reminders/medications/ui/widgets/medicines_list_view_skeletonizer_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicinesListViewSkeletonizer extends StatelessWidget {
  const MedicinesListViewSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const MedicinesListViewSkeletonizerItem();
          },
        ),
      ),
    );
  }
}
