import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_doctors/get_doctors_response.dart';

class DoctorDetailsHeader extends StatelessWidget {
  const DoctorDetailsHeader({super.key, required this.doctorData});
  final DoctorData doctorData;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  doctorData.image ?? 'assets/images/download.jpg',
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              // Wrapping this section to prevent overflow
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${doctorData.user!.firstName!} ${doctorData.user!.lastName!}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow:
                        TextOverflow.ellipsis, // This will handle long names
                  ),
                  Text(
                    doctorData.specialty!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow
                        .ellipsis, // This will handle long specialty names
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: doctorData.ratingsAverage ?? 0.0,
                        itemBuilder: (_, __) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 18.sp,
                        unratedColor: Colors.grey[300],
                        itemPadding: EdgeInsets.only(right: 2.w),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        doctorData.ratingsAverage?.toStringAsFixed(2) ?? '0.00',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' (${doctorData.ratingsQuantity ?? 0} Reviews)',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        doctorData.bookingPrice.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
