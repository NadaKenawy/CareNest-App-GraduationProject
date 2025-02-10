import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';

class MedicationsDropdown extends StatelessWidget {
  final String selectedImage;
  final Function(String? id, String name, String image, int index)
      onItemSelected;

  const MedicationsDropdown({
    super.key,
    required this.selectedImage,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      builder: (context, state) {
        List<Map<String, String>> items = [];
        if (state is Success) {
          items = state.babiesData?.map((baby) {
                return {
                  "name": baby.name ?? "Unknown",
                  "id": baby.id ?? "Unknown",
                  "gender": baby.gender ?? "Unknown",
                };
              }).toList() ??
              [];
        }
        items.add({
          "name": "All Reminders",
          "id": "",
          "gender": "All",
        });

        return Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 28.w,
              backgroundImage: AssetImage(selectedImage),
            ),
            Positioned(
              right: -6,
              bottom: -6,
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: PopupMenuButton<Map<String, String>>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    offset: const Offset(0, 32),
                    icon: Icon(Icons.arrow_drop_down, size: 22.sp),
                    padding: EdgeInsets.zero,
                    onSelected: (value) {
                      int index = value["name"] == "All Reminders" ? 1 : 0;
                      String? id = value["id"];
                      String name = value["name"]!;
                      String image;
                      if (value["name"] == "All Reminders") {
                        image = AppImages.boyAndGirlImage;
                      } else {
                        image = value["gender"] == "Male"
                            ? AppImages.boyProfileImage
                            : AppImages.girlProfileImage;
                      }
                      onItemSelected(id, name, image, index);
                    },
                    itemBuilder: (context) {
                      return items.map((item) {
                        String displayImage;
                        if (item["name"] == "All Reminders") {
                          displayImage = AppImages.boyAndGirlImage;
                        } else {
                          displayImage = item["gender"] == "Male"
                              ? AppImages.boyProfileImage
                              : AppImages.girlProfileImage;
                        }
                        return PopupMenuItem<Map<String, String>>(
                          value: item,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14.r,
                                backgroundImage: AssetImage(displayImage),
                              ),
                              SizedBox(width: 10.w),
                              Text(item["name"]!),
                            ],
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
