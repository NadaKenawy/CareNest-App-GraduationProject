import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';
import 'package:flutter/material.dart';
import 'vaccination_header.dart';
import 'vaccination_item.dart';

class VaccinationList extends StatelessWidget {
  final List<bool> isPressedList;
  final List<BabyVaccineData> vaccinesList;

  const VaccinationList({
    super.key,
    required this.isPressedList,
    required this.vaccinesList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vaccinesList.length,
      itemBuilder: (context, index) {
        final vaccine = vaccinesList[index];
        if (index % 4 == 0) {
          return const VaccinationHeader(
            title: "Vaccinations at birth",
            date: "16/2/2025",
          );
        }
        return VaccinationItem(
          vaccinesList: vaccinesList,
          isPressed: isPressedList[index],
          title: vaccine.vaccine!.name ?? '',
          subtitle: vaccine.vaccine!.description ?? '',
        );
      },
    );
  }
}
