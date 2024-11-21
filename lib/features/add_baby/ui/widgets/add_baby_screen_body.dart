import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_state.dart';
import 'package:care_nest/features/add_baby/ui/widgets/add_baby_bloc_listener.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import '../../logic/add_baby_cubit/add_baby_cubit.dart';
import 'header_section.dart';
import 'gender_selection.dart';

class AddBabyScreenBody extends StatefulWidget {
  const AddBabyScreenBody({super.key});

  @override
  _AddBabyScreenBodyState createState() => _AddBabyScreenBodyState();
}

class _AddBabyScreenBodyState extends State<AddBabyScreenBody> {
  final TextEditingController _dobController = TextEditingController();
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
          SizedBox(height: 40.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: context.read<AddBabyCubit>().formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BabyDataFields(
                        hintText: 'Baby Name',
                        gradient: gradient,
                        prefixIcon: Icons.child_care,
                        controller: context.read<AddBabyCubit>().nameController,
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
                              controller:
                                  context.read<AddBabyCubit>().weightController,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: BabyDataFields(
                              hintText: 'Height',
                              gradient: gradient,
                              prefixIcon: FontAwesomeIcons.rulerVertical,
                              controller:
                                  context.read<AddBabyCubit>().heightController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      GenderSelection(
                        gradient: gradient,
                        gender: gender,
                        onChanged: (value) {
                          setState(
                            () {
                              gender = value;
                              context
                                  .read<AddBabyCubit>()
                                  .genderController
                                  .text = value;
                            },
                          );
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
                validateThenSave(context);
              },
            ),
          ),
          const AddBabyBlocListener(),
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
        String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
        _dobController.text = formattedDate;
        context.read<AddBabyCubit>().dateOfBirthOfBabyController.text =
            formattedDate;
      });
    }
  }

  void validateThenSave(BuildContext context) async {
    final addBabyCubit = context.read<AddBabyCubit>();

    if (addBabyCubit.formKey.currentState!.validate()) {
      if (_isAnyFieldEmpty(addBabyCubit)) {
        _showErrorDialog(context, 'Please fill in all the fields.');
        return;
      }

      try {
        // Emit state and perform the operation
        addBabyCubit.emitAddBabyStates();

        final state = await addBabyCubit.stream
            .firstWhere((state) => state is AddBabyState);

        if (context.mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.canPop(context)) {
              context.pop();
            }

            state.whenOrNull(
              addBabysuccess: (addBabyResponse) {
                if (context.mounted) {
                  context.go(AppRouter.kMyBabiesScreen);
                }
              },
              addBabyerror: (error) {
                if (context.mounted) {
                  _showErrorDialog(context, error);
                }
              },
            );
          });
        }
      } catch (e) {
        if (context.mounted) {
          _showErrorDialog(context, 'An unexpected error occurred.');
        }
      }
    }
  }

  bool _isAnyFieldEmpty(AddBabyCubit cubit) {
    return cubit.nameController.text.isEmpty ||
        cubit.weightController.text.isEmpty ||
        cubit.heightController.text.isEmpty ||
        cubit.dateOfBirthOfBabyController.text.isEmpty ||
        cubit.genderController.text.isEmpty;
  }

  void _showErrorDialog(BuildContext context, String message) {
    if (context.mounted) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error',
        desc: message,
        btnOkOnPress: () {},
        btnOkColor: ColorsManager.primaryBlueColor,
      ).show();
    }
  }
}
