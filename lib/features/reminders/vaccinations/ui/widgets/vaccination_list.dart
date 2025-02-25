// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'vaccination_item.dart';
import 'package:care_nest/features/reminders/vaccinations/data/models/get_baby_vaccines_response.dart';

class VaccinationList extends StatelessWidget {
  final List<BabyVaccineData> vaccinesList;
  const VaccinationList({
    super.key,
    required this.vaccinesList,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, List<BabyVaccineData>> groupedVaccines = {};
    for (var vaccine in vaccinesList) {
      final createdAt = vaccine.date;
      if (createdAt != null) {
        final groupKey =
            DateFormat.yMMM().format(DateTime.parse(createdAt.toString()));
        if (!groupedVaccines.containsKey(groupKey)) {
          groupedVaccines[groupKey] = [];
        }
        groupedVaccines[groupKey]!.add(vaccine);
      }
    }

    final List<String> titles = [
      "Vaccines At Birth",
      "Vaccines At 2 Months",
      "Vaccines At 4 Months",
      "Vaccines At 6 Months",
      "Vaccines At 9 Months",
      "Vaccines At 12 Months",
      "Vaccines At 18 Months",
    ];

    final groupedEntries = groupedVaccines.entries.toList();
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 28.w, bottom: 16.h),
      child: ListView.builder(
        itemCount: groupedEntries.length,
        itemBuilder: (context, index) {
          final groupItems = groupedEntries[index].value;
          final title =
              titles.length > index ? titles[index] : "Additional Group";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? SizedBox(height: 16.h) : SizedBox(height: 32.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeightHelper.semiBold,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                DateFormat('d MMMM yyyy').format(
                  DateTime.parse(groupItems[0].date.toString()),
                ),
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeightHelper.semiBold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 8.h),
              ...groupItems.map((vaccine) {
                final formattedTime = DateFormat('d MMMM yyyy').format(
                  DateTime.parse(vaccine.date.toString()),
                );
                return VaccinationItem(
                  title: vaccine.vaccine?.name ?? 'Vaccine name',
                  subtitle: vaccine.vaccine?.description ??
                      'No description available',
                  data: formattedTime,
                  vaccineId: vaccine.vaccine?.id ?? '',
                  administered: vaccine.administered ?? false,
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
