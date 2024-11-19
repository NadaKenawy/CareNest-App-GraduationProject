import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'header_section.dart';
import 'gender_selection.dart';

class AddBabyScreenBody extends StatefulWidget {
  const AddBabyScreenBody({super.key});

  @override
  _AddBabyScreenBodyState createState() => _AddBabyScreenBodyState();
}

class _AddBabyScreenBodyState extends State<AddBabyScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _babyNameController = TextEditingController();
  String gender = '';

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
          SizedBox(
            height: 40.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BabyDataFields(
                        hintText: 'Baby Name',
                        gradient: gradient,
                        prefixIcon: Icons.child_care,
                        controller: _babyNameController,
                      ),
                      SizedBox(height: 24.h),
                      BabyDataFields(
                        hintText: 'Date of Birth',
                        gradient: gradient,
                        prefixIcon: FontAwesomeIcons.calendarDay,
                        controller: _dobController,
                        onTap: _selectDate,
                        readOnly: true,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Expanded(
                            child: BabyDataFields(
                              hintText: 'Weight',
                              gradient: gradient,
                              prefixIcon: FontAwesomeIcons.weightScale,
                              controller: _weightController,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: BabyDataFields(
                              hintText: 'Height',
                              gradient: gradient,
                              prefixIcon: FontAwesomeIcons.rulerVertical,
                              controller: _heightController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      GenderSelection(
                        gradient: gradient,
                        gender: gender,
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (gender.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please select a gender')),
                    );
                    return;
                  }
                }
              },
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
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}
