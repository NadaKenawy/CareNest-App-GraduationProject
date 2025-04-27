import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/logic/book_doctor_cubit/doctor_booking_cubit.dart';
import 'package:care_nest/features/doctors/logic/book_doctor_cubit/doctor_booking_state.dart';
import 'package:care_nest/features/doctors/logic/create_review/doctor_review_cubit.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_about.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_contact.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_header.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_select_schedule.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_working_hours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsScreenBody extends StatefulWidget {
  const DoctorDetailsScreenBody({super.key, required this.doctorData});
  final DoctorData doctorData;

  @override
  State<DoctorDetailsScreenBody> createState() =>
      _DoctorDetailsScreenBodyState();
}

class _DoctorDetailsScreenBodyState extends State<DoctorDetailsScreenBody> {
  late DaySchedule selectedDay;
  String? selectedHour;
  bool isPromoApplied = false;
  final TextEditingController promoCodeController = TextEditingController();
  int rating = 0;

  @override
  void initState() {
    super.initState();
    selectedDay = (widget.doctorData.day ?? []).isNotEmpty
        ? widget.doctorData.day!.first
        : DaySchedule();
  }

  void updateSelectedDay(DaySchedule newDay) {
    setState(() {
      selectedDay = newDay;
      selectedHour = null;
    });
  }

  void updateSelectedHour(String hour) {
    setState(() {
      selectedHour = hour;
    });
  }

  String calculateDateForDay(String dayName) {
    final days = {
      'Monday': DateTime.monday,
      'Tuesday': DateTime.tuesday,
      'Wednesday': DateTime.wednesday,
      'Thursday': DateTime.thursday,
      'Friday': DateTime.friday,
      'Saturday': DateTime.saturday,
      'Sunday': DateTime.sunday,
    };

    final now = DateTime.now();
    final todayWeekday = now.weekday;
    final targetWeekday = days[dayName] ?? todayWeekday;
    final daysUntilTarget = (targetWeekday - todayWeekday + 7) % 7;
    final targetDate = now.add(Duration(days: daysUntilTarget));
    return targetDate.toIso8601String().split('T').first;
  }

  Future<void> showRatingDialog() async {
    final reviewCubit = context.read<DoctorReviewCubit>();

    await AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      body: StatefulBuilder(
        builder: (dialogContext, setStateDialog) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Rate the Doctor!', style: TextStyles.font20BlackSemiBold),
                SizedBox(height: 8.h),
                Text(
                  'Rate your doctor to help us improve your experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        final newRating = index + 1;
                        setStateDialog(() => rating = newRating);
                        reviewCubit.submitReview(
                          doctorId: widget.doctorData.id ?? "",
                          ratings: newRating,
                        );
                        Navigator.pop(dialogContext);
                      },
                      icon: Icon(
                        rating >= index + 1 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32.sp,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () => Navigator.pop(dialogContext),
                  child: Text('No Thanks!',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          );
        },
      ),
    ).show();
  }

  Future<void> bookAppointment() async {
    try {
      if (selectedHour == null) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: 'Please select a working hour',
          btnOkOnPress: () {},
        ).show();
        return;
      }

      String enteredPromo = promoCodeController.text.trim();
      bool promoValid = true;

      if (isPromoApplied) {
        if (enteredPromo.isEmpty || widget.doctorData.promocode == null) {
          promoValid = false;
        } else {
          promoValid = widget.doctorData.promocode!.code == enteredPromo;
        }
      }

      if (!promoValid) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: 'Invalid Promo Code',
          btnOkOnPress: () {},
        ).show();
        return;
      }

      String selectedDate = calculateDateForDay(selectedDay.type ?? "");
      final timeParts = selectedHour!.split(':');
      final formattedTime =
          "${timeParts[0].padLeft(2, '0')}:${timeParts[1].padLeft(2, '0')}:00";
      final dateTimeString = "$selectedDate $formattedTime";

      await context.read<DoctorBookingCubit>().bookDoctorAppointment(
            doctorId: widget.doctorData.id ?? "",
            appointmentDateTime:
                DateTime.parse(dateTimeString).toUtc().toIso8601String(),
            promoCode: isPromoApplied ? enteredPromo : null,
          );
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: 'An unexpected error occurred. Please try again.',
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().toIso8601String().split('T').first;
    return BlocListener<DoctorBookingCubit, DoctorBookingState>(
      listener: (context, state) {
        state.whenOrNull(
          bookingError: (error) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: 'Booking Failed',
              desc: error.message ??
                  'An error occurred while booking the appointment.',
              btnOkOnPress: () {},
            ).show();
          },
          bookingSuccess: (response) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              title: 'Booking Confirmed',
              desc: 'Your appointment has been booked successfully.',
              btnOkOnPress: () async {
                await Future.delayed(const Duration(milliseconds: 300));
                await showRatingDialog();
                context.pop();
              },
            ).show();
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          backgroundColor: const Color(0xfff9f9f9),
          title:
              Text('Doctor Details', style: TextStyles.font20BlackSemiMedium),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DoctorDetailsHeader(doctorData: widget.doctorData),
                  SizedBox(height: 20.h),
                  DoctorDetailsAbout(doctorData: widget.doctorData),
                  SizedBox(height: 20.h),
                  DoctorDetailsContact(doctorData: widget.doctorData),
                  SizedBox(height: 20.h),
                  DoctorDetailsSelectSchedule(
                    selectedDay: selectedDay,
                    doctorData: widget.doctorData,
                    onDaySelected: updateSelectedDay,
                  ),
                  SizedBox(height: 20.h),
                  DoctorDetailsWorkingHours(
                    doctorData: widget.doctorData,
                    selectedDay: selectedDay,
                    selectedHour: selectedHour,
                    onHourSelected: updateSelectedHour,
                    bookingDate: today,
                  ),
                  SizedBox(height: 24.h),
                  if (isPromoApplied && widget.doctorData.promocode != null)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.green.withAlpha(40),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 28.sp),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.doctorData.promocode!.code.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "${widget.doctorData.promocode!.value?.toDouble()}% Discount\nFinal Price: ${widget.doctorData.bookingPrice != null ? (widget.doctorData.bookingPrice! * widget.doctorData.promocode!.value!.toInt() / 100) : 'N/A'}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.sp)),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isPromoApplied = false;
                                promoCodeController.clear();
                              });
                            },
                            icon: const Icon(Icons.close, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: ColorsManager.secondryBlueColor,
                            controller: promoCodeController,
                            decoration: InputDecoration(
                              constraints: const BoxConstraints(minHeight: 48),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: BorderSide(
                                    color: ColorsManager.secondryBlueColor,
                                    width: 2.w),
                              ),
                              hintText: 'Promo code',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        AppTextButton(
                          buttonText: 'Apply',
                          textStyle: TextStyles.font16WhiteMedium,
                          buttonColor: ColorsManager.secondryBlueColor,
                          buttonWidth: 80.w,
                          onPressed: () {
                            final entered = promoCodeController.text.trim();
                            if (entered.isEmpty) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                title: 'Error',
                                desc: 'Please enter a promo code',
                                btnOkOnPress: () {},
                              ).show();
                            } else if (widget.doctorData.promocode == null ||
                                widget.doctorData.promocode!.code != entered) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                title: 'Error',
                                desc: 'Invalid Promo Code',
                                btnOkOnPress: () {},
                              ).show();
                            } else {
                              setState(() => isPromoApplied = true);
                            }
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 24.h),
                  AppTextButton(
                    buttonText: 'Book An Appointment',
                    textStyle: TextStyles.font16WhiteMedium,
                    buttonColor: ColorsManager.secondryBlueColor,
                    onPressed: bookAppointment,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
