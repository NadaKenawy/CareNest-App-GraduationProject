import 'dart:io';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BabyDropdownMode {
  withAllReminders,
  basicWithGender,
  precomputedImage,
}

class BabyDropdown extends StatelessWidget {
  final String selectedImage;
  final BabyDropdownMode mode;
  final void Function(String id, String name, String image, [int? index])
      onSelected;

  const BabyDropdown({
    super.key,
    required this.selectedImage,
    required this.onSelected,
    required this.mode,
  });

  ImageProvider getImageProvider(String imagePath) {
    if (imagePath.startsWith('http')) {
      return NetworkImage(imagePath);
    } else if (imagePath.startsWith('/')) {
      return FileImage(File(imagePath));
    } else {
      return AssetImage(imagePath);
    }
  }

  String getBabyImage({
    required String? babyImage,
    required String gender,
    required String name,
  }) {
    if (name == "All Reminders") return AppImages.boyAndGirlImage;
    if (babyImage?.isNotEmpty ?? false) return babyImage!;
    return gender == "Male"
        ? AppImages.boyProfileImage
        : AppImages.girlProfileImage;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      builder: (context, state) {
        List<Map<String, String>> items = [];

        if (state is Success) {
          items = state.babiesData?.map((baby) {
                return {
                  "id": baby.id ?? "",
                  "name": baby.name ?? "",
                  "gender": baby.gender ?? "Male",
                  "image": baby.babyImage ?? "",
                };
              }).toList() ??
              [];
        }

        if (mode == BabyDropdownMode.withAllReminders) {
          items.add({
            "id": "",
            "name": "All Reminders",
            "gender": "All",
            "image": "",
          });
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 28.w,
              backgroundImage: getImageProvider(selectedImage),
            ),
            if (items.length > 1)
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
                        final name = value["name"] ?? "";
                        final id = value["id"] ?? "";
                        final gender = value["gender"] ?? "Male";
                        final image = getBabyImage(
                          babyImage: value["image"],
                          gender: gender,
                          name: name,
                        );

                        if (mode == BabyDropdownMode.withAllReminders) {
                          final index = name == "All Reminders" ? 1 : 0;
                          onSelected(id, name, image, index);
                        } else {
                          onSelected(id, name, image);
                        }
                      },
                      itemBuilder: (context) {
                        return items.map((item) {
                          final gender = item["gender"] ?? "Male";
                          final name = item["name"] ?? "";
                          final image = getBabyImage(
                            babyImage: item["image"],
                            gender: gender,
                            name: name,
                          );

                          return PopupMenuItem<Map<String, String>>(
                            value: item,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 14.r,
                                  backgroundImage: getImageProvider(image),
                                ),
                                SizedBox(width: 10.w),
                                Text(name),
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
