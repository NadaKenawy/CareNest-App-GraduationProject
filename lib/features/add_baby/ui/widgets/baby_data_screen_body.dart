// ignore_for_file: camel_case_types, avoid_print

import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import '../../data/models/get_all_babies_response.dart';
import 'gender_selection.dart';
import 'header_section.dart';

class BabyDataScreenBody extends StatefulWidget {
  const BabyDataScreenBody({
    super.key,
    required this.babiesData,
  });
  final BabiesData babiesData;
  @override
  _BabyDataScreenBodyState createState() => _BabyDataScreenBodyState();
}

class _BabyDataScreenBodyState extends State<BabyDataScreenBody> {
  String gender = '';
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    const Gradient gradient = LinearGradient(
      colors: [
        ColorsManager.secondryBlueColor,
        ColorsManager.primaryPinkColor,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderSection(),
          SizedBox(height: 40.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BabyDataFields(
                      hintText: widget.babiesData.name ?? 'Baby Name',
                      gradient: gradient,
                      prefixIcon: Icons.child_care,
                    ),
                    SizedBox(height: 24.h),
                    BabyDataFields(
                      hintText: widget.babiesData.dateOfBirth != null
                          ? widget.babiesData.dateOfBirth
                              .toString()
                              .split(' ')[0]
                          : 'Date of Birth',
                      gradient: gradient,
                      prefixIcon: FontAwesomeIcons.calendarDay,
                      controller: TextEditingController(text: selectedDate),
                      onTap: _selectDate,
                      readOnly: true,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: BabyDataFields(
                            hintText: widget.babiesData.weight != null
                                ? widget.babiesData.weight.toString()
                                : 'Weight',
                            gradient: gradient,
                            prefixIcon: FontAwesomeIcons.weightScale,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: BabyDataFields(
                            hintText: widget.babiesData.height != null
                                ? widget.babiesData.height.toString()
                                : 'Height',
                            gradient: gradient,
                            prefixIcon: FontAwesomeIcons.rulerVertical,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    GenderSelection(
                      gradient: gradient,
                      gender: widget.babiesData.gender ?? 'Gender',
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: AppTextButton(
              buttonText: 'Save',
              textStyle: TextStyles.font16WhiteBold,
              gradientColors: const [
                ColorsManager.secondryBlueColor,
                ColorsManager.primaryPinkColor,
              ],
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}
