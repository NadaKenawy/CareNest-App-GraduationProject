import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoMedicinesText extends StatelessWidget {
  const NoMedicinesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'No Medicines Added\nFor Your Baby Yet!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 28.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
