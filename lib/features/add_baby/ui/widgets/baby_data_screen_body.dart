import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/add_baby/data/models/get_baby_data_response.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'gender_selection.dart';
import 'header_section.dart';

class BabyDataScreenBody extends StatefulWidget {
  final BabyData babyData;

  const BabyDataScreenBody({super.key, required this.babyData});

  @override
  _babyDataScreenBodyState createState() => _babyDataScreenBodyState();
}

class _babyDataScreenBodyState extends State<BabyDataScreenBody> {
  late BabyData babyData;
  String gender = '';
  String selectedDate = '';

  @override
  void initState() {
    super.initState();
    babyData = widget.babyData;
    print(
        'Baby Data: ${babyData.name}, ${babyData.dateOfBirth}, ${babyData.weight}, ${babyData.height}, ${babyData.gender}');
  }

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
                      hintText: babyData.name ?? 'Baby Name',
                      gradient: gradient,
                      prefixIcon: Icons.child_care,
                    ),
                    SizedBox(height: 24.h),
                    BabyDataFields(
                      hintText: babyData.dateOfBirth != null
                          ? babyData.dateOfBirth.toString().split(' ')[0]
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
                            hintText: babyData.weight != null
                                ? babyData.weight.toString()
                                : 'Weight',
                            gradient: gradient,
                            prefixIcon: FontAwesomeIcons.weightScale,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: BabyDataFields(
                            hintText: babyData.height != null
                                ? babyData.height.toString()
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
                      gender: babyData.gender ?? 'Gender',
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
