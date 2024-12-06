import 'package:flutter/material.dart';
import 'vaccination_header.dart';
import 'vaccination_item.dart';

class VaccinationList extends StatelessWidget {
  final List<bool> isPressedList;
  final Function(int) onItemPressed;

  const VaccinationList({
    super.key,
    required this.isPressedList,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index % 4 == 0) {
          return const VaccinationHeader(
            title: "Vaccinations at birth",
            date: "16/2/2025",
          );
        }
        return VaccinationItem(
          title: "Vaccination Name",
          subtitle: "Track your baby's health and development with ease!",
          isPressed: isPressedList[index],
          onPressed: () => onItemPressed(index),
        );
      },
    );
  }
}
