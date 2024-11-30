import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/features/reminders/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/get_all_medication_schedule_response.dart';
import 'medicines_list_view_item.dart';

class MedicinesListView extends StatelessWidget {
  const MedicinesListView({
    super.key,
    required this.medicinesList,
  });
  final List<MedicationData> medicinesList;

  @override
  Widget build(BuildContext context) {
    final reversedList = medicinesList.reversed.toList();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reversedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final babyId = await SharedPrefHelper.getSecuredString(
                  SharedPrefKeys.babyId);
              GoRouter.of(context)
                  .push(AppRouter.kUpdateMedicineScreen,
                      extra: medicinesList[index])
                  .then((value) {
                if (value == true) {
                  context
                      .read<GetAllMedicationScheduleCubit>()
                      .getAllMedicationSchedule(babyId);
                }
              });
            },
            child: MedicinesListViewItem(
              medicinesList: medicinesList[index],
            ),
          );
        },
      ),
    );
  }
}
