import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/reminders/vaccinations/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  String? babyId;
  List<bool> isPressedList = List.generate(12, (_) => false);

  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final babyIdFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);
    final babyNameFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    setState(() {
      babyId = babyIdFromStorage;
      selectedBabyName = babyNameFromStorage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedBabyName?.isNotEmpty == true
              ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Vaccinations"
              : 'My Vaccinations',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeightHelper.semiBold,
          ),
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
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
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
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            if (index % 4 == 0) {
              return Padding(
                padding: EdgeInsets.only(top: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vaccinations at birth",
                      style: TextStyles.font20BlackSemiBold,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      " 16/2/2025",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              );
            }
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
                  color: ColorsManager.secondryBlueColor.withOpacity(.1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPressedList[index] = !isPressedList[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isPressedList[index]
                                ? ColorsManager.secondryBlueColor
                                : Colors.grey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 28.sp),
                          ),
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vaccination Name",
                              style: TextStyle(
                                fontWeight: FontWeightHelper.semiBold,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Track your baby's health and development with ease!",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.5),
                                fontWeight: FontWeightHelper.medium,
                                fontSize: 12.sp,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
        ),
      ),
    );
  }
}
