import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../data/models/get_doctors/get_doctors_response.dart';
import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctorsList});
  final List<DoctorData> doctorsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: GestureDetector(
              onTap: () => GoRouter.of(context).push(
                  AppRouter.kDoctorDetailsScreen,
                  extra: doctorsList[index]),
              child: DoctorsListViewItem(
                doctorData: doctorsList[index],
              ),
            ),
          );
        });
  }
}
