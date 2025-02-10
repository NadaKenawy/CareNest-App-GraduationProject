import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';

class VaccinationsSidebar extends StatelessWidget {
  final String selectedImage;
  final Function(String, String, String) onBabySelected;

  const VaccinationsSidebar({
    super.key,
    required this.selectedImage,
    required this.onBabySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      builder: (context, state) {
        List<Map<String, String>> babies = [];
        if (state is Success) {
          babies = state.babiesData?.map((baby) {
                return {
                  "name": baby.name ?? "Unknown",
                  "id": baby.id ?? "Unknown",
                  "gender": baby.gender ?? "Unknown",
                };
              }).toList() ??
              [];
        }

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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.white,
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
                      final String image = value["gender"] == 'Male'
                          ? AppImages.boyProfileImage
                          : AppImages.girlProfileImage;
                      onBabySelected(value["id"]!, value["name"]!, image);
                    },
                    itemBuilder: (context) {
                      return babies.map((child) {
                        final String childImage = child["gender"] == 'Male'
                            ? AppImages.boyProfileImage
                            : AppImages.girlProfileImage;
                        return PopupMenuItem<Map<String, String>>(
                          value: child,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14.r,
                                backgroundImage: AssetImage(childImage),
                              ),
                              SizedBox(width: 10.w),
                              Text(child["name"]!),
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
