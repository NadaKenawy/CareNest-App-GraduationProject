import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';

class BabiesDropdown extends StatelessWidget {
  final String selectedImage;
  final Function(String, String) onBabySelected;

  const BabiesDropdown({
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
                  "image": baby.gender == 'Male'
                      ? "assets/images/baby_profile_boy.png"
                      : "assets/images/baby_profile_girl.png",
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
                      onBabySelected(value["name"]!, value["image"]!);
                    },
                    itemBuilder: (context) {
                      return babies.map((child) {
                        return PopupMenuItem<Map<String, String>>(
                          value: child,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14.r,
                                backgroundImage: AssetImage(child["image"]!),
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
