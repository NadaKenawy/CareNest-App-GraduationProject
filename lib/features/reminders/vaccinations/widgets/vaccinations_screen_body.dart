import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/reminders/vaccinations/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sidebarx/sidebarx.dart';

class VaccinationsScreenBody extends StatefulWidget {
  const VaccinationsScreenBody({super.key});

  @override
  State<VaccinationsScreenBody> createState() => _VaccinationsScreenBodyState();
}

class _VaccinationsScreenBodyState extends State<VaccinationsScreenBody> {
  final SidebarXController _controller = SidebarXController(selectedIndex: -1);
  String? selectedBabyName = '';
  int? selectedIndex;
  String? babyBirthDate;
  String? babyId;
  Map<String, List<bool>> isPressedMap = {};

  Map<String, List<Map<String, String>>> vaccinationsByAge = {
    "Vaccines At Birth": [
      {"name": "Sabin (Polio)", "description": "Protects against polio"},
      {
        "name": "BCG (Tuberculosis)",
        "description": "Protects against tuberculosis"
      },
      {"name": "Hepatitis B", "description": "Protects against Hepatitis B"},
    ],
    "Vaccines At 2 Months": [
      {
        "name": "Polio (First Dose)",
        "description": "First dose of polio vaccine"
      },
      {
        "name": "DTP (Diphtheria, Tetanus, Pertussis)",
        "description":
            "Protects against diphtheria, tetanus, and whooping cough"
      },
      {
        "name": "Hib (Haemophilus Influenzae)",
        "description": "Protects against respiratory infections and meningitis"
      },
      {
        "name": "Hepatitis B (Booster)",
        "description": "Second dose for Hepatitis B protection"
      },
      {
        "name": "PCV (Pneumococcal)",
        "description": "Protects against pneumonia"
      },
    ],
    "Vaccines At 4 Months": [
      {
        "name": "Polio (Second Dose)",
        "description": "Second dose of polio vaccine"
      },
      {
        "name": "DTP (Second Dose)",
        "description": "Second dose for Diphtheria, Tetanus, and Pertussis"
      },
      {
        "name": "Hib (Second Dose)",
        "description": "Second dose for Haemophilus Influenzae"
      },
    ],
    "Vaccines At 6 Months": [
      {
        "name": "Polio (Third Dose)",
        "description": "Third dose of polio vaccine"
      },
      {
        "name": "DTP (Third Dose)",
        "description": "Third dose for Diphtheria, Tetanus, and Pertussis"
      },
    ],
    "Vaccines At 9 Months": [
      {
        "name": "Measles, Mumps, Rubella (MMR)",
        "description": "Protects against measles, mumps, and rubella"
      },
      {"name": "Sabin (Polio)", "description": "Third dose of polio vaccine"},
    ],
    "Vaccines At 12 Months": [
      {
        "name": "Measles, Mumps, Rubella (MMR)",
        "description": "Second dose of MMR vaccine"
      },
      {"name": "Hepatitis A", "description": "Protects against Hepatitis A"},
      {
        "name": "Varicella (Chickenpox)",
        "description": "Protects against chickenpox"
      },
    ],
    "Vaccines At 18 Months": [
      {
        "name": "DTP (Fourth Dose)",
        "description": "Fourth dose of DTP vaccine"
      },
      {
        "name": "Polio (Fourth Dose)",
        "description": "Fourth dose of polio vaccine"
      },
      {
        "name": "Hib (Fourth Dose)",
        "description": "Fourth dose of Hib vaccine"
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    loadBabyData();
    initializeIsPressedMap();
  }

  void initializeIsPressedMap() {
    vaccinationsByAge.forEach((key, value) {
      isPressedMap[key] = List.generate(value.length, (_) => false);
    });
  }

  Future<void> loadBabyData() async {
    // Retrieve baby data from shared preferences or from another source
    final babyIdFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);
    final babyNameFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    final babyBirthDayFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyDateOfBirth);
    setState(() {
      babyId = babyIdFromStorage;
      selectedBabyName = babyNameFromStorage;
      babyBirthDate = babyBirthDayFromStorage;
    });
  }

  String calculateVaccineDate(String birthDate, int monthsToAdd) {
    DateTime birthDateTime;

    try {
      birthDateTime = DateFormat('yyyy-MM-dd').parse(birthDate);
    } catch (e) {
      try {
        birthDateTime = DateFormat('dd/MM/yyyy').parse(birthDate);
      } catch (e) {
        throw FormatException("Invalid date format: $birthDate");
      }
    }

    DateTime vaccineDate = DateTime(birthDateTime.year,
        birthDateTime.month + monthsToAdd, birthDateTime.day);
    return DateFormat('dd/MM/yyyy').format(vaccineDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedBabyName?.isNotEmpty == true
              ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Vaccinations"
              : 'My Vaccinations',
          style: TextStyles.font20BlackSemiBold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 24),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: VaccinationsSidebarX(
        controller: _controller,
        onItemSelected: (index) async {
          setState(() {
            selectedIndex = index;
          });

          // After changing index, load the selected baby data
          await loadBabyData();
        },
        selectedBabyName: (String name) {
          setState(() {
            selectedBabyName = name;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.h, right: 16.w, left: 16.w),
        child: ListView(
          children: vaccinationsByAge.entries.map((entry) {
            String ageGroup = entry.key;
            List<Map<String, String>> vaccinationsList = entry.value;

            int months = 0;
            switch (ageGroup) {
              case "Vaccines At Birth":
                months = 0;
                break;
              case "Vaccines At 2 Months":
                months = 2;
                break;
              case "Vaccines At 4 Months":
                months = 4;
                break;
              case "Vaccines At 6 Months":
                months = 6;
                break;
              case "Vaccines At 9 Months":
                months = 9;
                break;
              case "Vaccines At 12 Months":
                months = 12;
                break;
              case "Vaccines At 18 Months":
                months = 18;
                break;
              default:
                months = 0;
            }

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ageGroup,
                    style: TextStyles.font20BlackSemiBold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    babyBirthDate != null && babyBirthDate!.isNotEmpty
                        ? calculateVaccineDate(babyBirthDate!, months)
                        : "Invalid Birth Date",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: vaccinationsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var vaccination = vaccinationsList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border(
                              left: BorderSide(
                                color: ColorsManager.secondryBlueColor,
                                width: 8.w,
                              ),
                            ),
                            color:
                                ColorsManager.secondryBlueColor.withOpacity(.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPressedMap[ageGroup]![index] =
                                          !isPressedMap[ageGroup]![index];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isPressedMap[ageGroup]![index]
                                          ? ColorsManager.secondryBlueColor
                                          : Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.sp),
                                      child: Icon(Icons.check,
                                          color: Colors.white, size: 26.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24.w),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vaccination["name"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeightHelper.semiBold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        vaccination["description"]!,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.5),
                                          fontWeight: FontWeightHelper.medium,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
