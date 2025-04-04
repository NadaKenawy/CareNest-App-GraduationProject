import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/get_doctors/get_doctors_response.dart';

class DoctorDetailsContact extends StatelessWidget {
  const DoctorDetailsContact({super.key, required this.doctorData});
  final DoctorData doctorData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          if (doctorData.location != null &&
              doctorData.location!.address != null)
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20.sp,
                  color: const Color(0xff418fbf),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    doctorData.location?.address ?? 'No address available',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.visible, // Truncate long text
                  ),
                ),
              ],
            ),
          SizedBox(height: 8.h),
          if (doctorData.phones != null && doctorData.phones!.isNotEmpty)
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 20.sp,
                  color: const Color(0xff418fbf),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    doctorData.phones!.isNotEmpty
                        ? doctorData.phones!.first
                        : '01212688610',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis, // Truncate long text
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
