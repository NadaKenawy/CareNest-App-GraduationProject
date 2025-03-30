import 'package:care_nest/core/di/service_locator.dart';
import 'package:care_nest/features/add_baby/data/models/get_all_babies/get_all_babies_response.dart';
import 'package:care_nest/features/add_baby/logic/add_baby_cubit/add_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/delete_baby_cubit/delete_baby_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/update_baby_cubit/update_baby_cubit.dart';
import 'package:care_nest/features/add_baby/ui/add_baby_screen.dart';
import 'package:care_nest/features/add_baby/ui/baby_data_screen.dart';
import 'package:care_nest/features/add_baby/ui/my_babies_screen.dart';
import 'package:care_nest/features/analysis_result/analysis_result_screen.dart';
import 'package:care_nest/features/baby_cry/logic/cubit/prediction_cubit.dart';
import 'package:care_nest/features/baby_cry/ui/recorder_screen.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_height_growth_cubit/get_baby_height_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/get_baby_weight_growth_cubit/get_baby_weight_growth_cubit.dart';
import 'package:care_nest/features/baby_growth/logic/latest_growth_data_cubit/latest_growth_data_cubit.dart';
import 'package:care_nest/features/baby_growth/ui/baby_height_growth_screen.dart';
import 'package:care_nest/features/baby_growth/ui/widgets/baby_weight_growth_screen_body.dart';
import 'package:care_nest/features/doctors/logic/book_doctor_cubit/doctor_booking_cubit.dart';
import 'package:care_nest/features/doctors/logic/cancel_booked_appointment_cubit/cancel_booked_appointment_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_booked_appointments_cubit/get_booked_appointments_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_hospitals_cubit/get_all_hospitals_cubit.dart';
import 'package:care_nest/features/doctors/ui/doctors_screen.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctor_details_screen_body.dart';
import 'package:care_nest/features/doctors/ui/widgets/my_appointment_screen_body.dart';
import 'package:care_nest/features/entertainment/entertainment_screen.dart';

import 'package:care_nest/features/entertainment/music_and_sweet_noise/logic/get_white_noise/get_white_noise_cubit.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/logic/get_music_cubit/get_music_cubit.dart';

import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/sweet_sleep_page_two.dart';
import 'package:care_nest/features/entertainment/music_and_sweet_noise/ui/sweet_sleep_page_view.dart';
import 'package:care_nest/features/entertainment/fun_videos/logic/get_all_channels_cubit.dart';
import 'package:care_nest/features/entertainment/fun_videos/ui/fun_video_screen.dart';
import 'package:care_nest/features/entertainment/short_stories/data/models/get_all_stories_response.dart';
import 'package:care_nest/features/entertainment/short_stories/logic/get_all_stories_cubit.dart';
import 'package:care_nest/features/entertainment/short_stories/ui/short_stories_screen.dart';
import 'package:care_nest/features/entertainment/short_stories/ui/widgets/story_details_screen_body.dart';
import 'package:care_nest/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:care_nest/features/fcm/logic/notification_cubit/notification_cubit.dart';
import 'package:care_nest/features/fcm/ui/notifications_screen.dart';
import 'package:care_nest/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:care_nest/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:care_nest/features/forget_password/ui/forget_pass_screen.dart';
import 'package:care_nest/features/forget_password/ui/verify_password_screen.dart';
import 'package:care_nest/features/forget_password/ui/create_new_password_screen.dart';
import 'package:care_nest/features/home/ui/home_screen.dart';
import 'package:care_nest/features/login/logic/login_cubit/login_cubit.dart';
import 'package:care_nest/features/login/ui/login_screen.dart';
import 'package:care_nest/features/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:care_nest/features/reminders/medications/data/models/get_all_medication_schedule/get_all_medication_schedule_response.dart';
import 'package:care_nest/features/reminders/medications/logic/add_medication_schedule_cubit/add_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/delete_medication_schedule_cubit/delete_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_babies_medication_schedule_cubit/get_all_babies_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/get_all_medication_schedule_cubit/get_all_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/logic/update_medication_schedule_cubit/update_medication_schedule_cubit.dart';
import 'package:care_nest/features/reminders/medications/ui/add_medicine_screen.dart';
import 'package:care_nest/features/reminders/medications/ui/medications_screen.dart';
import 'package:care_nest/features/reminders/reminders_screen.dart';
import 'package:care_nest/features/reminders/medications/ui/widgets/update_medicines_screen_body.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/mark_vaccine_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/vaccinations_screen.dart';
import 'package:care_nest/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:care_nest/features/sign_up/logic/verfiy_account_cubit/verify_account_cubit.dart';
import 'package:care_nest/features/sign_up/ui/sign_up_screen.dart';
import 'package:care_nest/features/sign_up/ui/verfiy_account_screen.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_baby_cubit/get_all_tips_of_baby_cubit.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_mom_cubit/get_all_tips_of_mom_cubit.dart';
import 'package:care_nest/features/tips/logic/get_tip_details_cubit/get_tip_details_cubit.dart';
import 'package:care_nest/features/tips/ui/baby_tips_screen.dart';
import 'package:care_nest/features/tips/ui/mom_tips_screen.dart';
import 'package:care_nest/features/tips/ui/target_selection_screen.dart';
import 'package:care_nest/features/tips/ui/widgets/tip_details_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/baby_cry/data/model/prediction_response_model.dart';
import '../../features/doctors/data/models/get_doctors/get_doctors_response.dart';

abstract class AppRouter {
  static const kSignUpScreen = '/signUpScreen';
  static const kLoginScreen = '/loginScreen';
  static const kOnBoardingScreen = '/';
  static const kHomeScreen = '/homeScreen';
  static const kForgetPassScreen = '/forgetPassScreen';
  static const kVerifyPasswordScreen = '/verifyPasswordScreen';
  static const kCreateNewPasswordScreen = '/createNewPasswordScreen';
  static const kVerifyAccountScreen = '/verifyAccountScreen';
  static const kAddBabyScreen = '/addBabyScreen';
  static const kMyBabiesScreen = '/myBabiesScreen';
  static const kBabyDataScreen = '/babyDataScreen';
  static const kMedicationsScreen = '/medicationsScreen';
  static const kAddMedicineScreen = '/addMedicineScreen';
  static const kUpdateMedicineScreen = '/updateMedicineScreen';
  static const kRemindersScreen = '/remindersScreen';
  static const kVaccinationsScreen = '/vaccinationsScreen';
  static const kNotificationsScreen = '/notificationsScreen';
  static const kRecoderScreen = '/recoderScreen';
  static const kAnalysisResultScreen = '/analysisResultScreen';
  static const kBabyHeightGrowthScreen = '/babyHeightGrowthScreen';
  static const kBabyWeightGrowthScreen = '/babyWeightGrowthScreen';
  static const kTargetSelectionScreen = '/targetSelectionScreen';
  static const kBabyTipsScreen = '/babyTipsScreen';
  static const kMomTipsScreen = '/momTipsScreen';
  static const kTipDetailsScreen = '/tipDetailsScreen';
  static const kEntertainmentScreen = '/EntertainmentScreen';
  static const kSweetSleep = '/SweetSleep';
  static const kShortStoriesScreen = '/shortStoriesScreen';
  static const kStoryDetailsScreen = '/storyDetailsScreen';
  static const kWhiteNoise = '/whiteNoise';
  static const kFunVideosScreen = '/funVideosScreen';
  static const kDoctorsScreen = '/doctorsScreen';
  static const kDoctorDetailsScreen = '/doctorDetailsScreen';
  static const kMyAppointmentsScreen = '/myAppointmentsScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: kOnBoardingScreen,
          builder: (context, state) {
            return const OnBoardingScreen();
          }),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
          path: kHomeScreen,
          builder: (context, state) {
            final userName = state.extra as String? ?? 'User';
            return HomeScreen(userName: userName);
          }),
      GoRoute(
        path: kForgetPassScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPassScreen(),
        ),
      ),
      GoRoute(
        path: kVerifyPasswordScreen,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<VerifyPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
          ),
        ], child: const VerifyPassword()),
      ),
      GoRoute(
        path: kCreateNewPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<CreateNewPasswordCubit>(),
          child: const CreateNewPasswordScreen(),
        ),
      ),
      GoRoute(
        path: kVerifyAccountScreen,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<VerifyAccountCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<SignupCubit>(),
          ),
        ], child: const VerifyAccountScreen()),
      ),
      GoRoute(
        path: kAddBabyScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AddBabyCubit>(),
              ),
              // BlocProvider.value(
              //   value: state.extra as GetAllBabiesCubit,
              // ),
            ],
            child: const AddBabyScreen(),
          );
        },
      ),
      GoRoute(
        path: kMyBabiesScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteBabyCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpdateBabyCubit>(),
              ),
            ],
            child: const MyBabiesScreen(),
          );
        },
      ),
      GoRoute(
        path: kBabyDataScreen,
        builder: (context, state) {
          final babyData = state.extra as BabiesData;
          return BlocProvider(
            create: (context) => UpdateBabyCubit(getIt(), babyData),
            child: BabyDataScreen(
              babiesData: babyData,
            ),
          );
        },
      ),
      GoRoute(
          path: kRemindersScreen,
          builder: (context, state) {
            return const RemindersScreen();
          }),
      GoRoute(
        path: kMedicationsScreen,
        builder: (context, state) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<GetAllBabiesCubit>()..getAllBabies(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllMedicationScheduleCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<UpdateMedicationScheduleCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<DeleteMedicationScheduleCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllBabiesMedicationScheduleCubit>(),
            ),
          ], child: const MedicationsScreen());
        },
      ),
      GoRoute(
        path: kAddMedicineScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<AddMedicationScheduleCubit>(),
            child: const AddMedicineScreen(),
          );
        },
      ),
      GoRoute(
        path: kUpdateMedicineScreen,
        builder: (context, state) {
          final MedicationData medicineDataList = state.extra as MedicationData;
          return BlocProvider(
            create: (context) =>
                UpdateMedicationScheduleCubit(getIt(), medicineDataList),
            child: UpdateMedicinesScreenBody(
              medicinesList: medicineDataList,
            ),
          );
        },
      ),
      GoRoute(
          path: kVaccinationsScreen,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<GetAllBabiesCubit>()..getAllBabies(),
                ),
                BlocProvider(
                  create: (context) => getIt<GetBabyVaccinesCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<MarkVaccineCubit>(),
                ),
              ],
              child: const VaccinationsScreen(),
            );
          }),
      GoRoute(
          path: kNotificationsScreen,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<GetAllNotificationsCubit>()..fetchNotifications(),
                ),
                BlocProvider(
                  create: (context) => getIt<NotificationsCubit>(),
                ),
              ],
              child: const NotificationsScreen(),
            );
          }),
      GoRoute(
          path: kRecoderScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<PredictionCubit>(),
              child: const RecorderScreen(),
            );
          }),
      GoRoute(
          path: kAnalysisResultScreen,
          builder: (context, state) {
            final predictionResponse = state.extra as PredictionResponse;
            return AnalysisResultScreen(
              predictionResponse: predictionResponse,
            );
          }),
      GoRoute(
          path: kBabyHeightGrowthScreen,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<GetAllBabiesCubit>()..getAllBabies(),
                ),
                BlocProvider(
                  create: (context) => getIt<GetBabyHeightGrowthCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<LatestGrowthDataCubit>(),
                ),
              ],
              child: const BabyHeightGrowthScreen(),
            );
          }),
      GoRoute(
          path: kBabyWeightGrowthScreen,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      getIt<GetAllBabiesCubit>()..getAllBabies(),
                ),
                BlocProvider(
                  create: (context) => getIt<GetBabyWeightGrowthCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<LatestGrowthDataCubit>(),
                ),
              ],
              child: const BabyWeightGrowthScreenBody(),
            );
          }),
      GoRoute(
          path: kTargetSelectionScreen,
          builder: (context, state) {
            return const TargetSelectionScreen();
          }),
      GoRoute(
          path: kBabyTipsScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<GetAllTipsOfBabyCubit>(),
              child: const BabyTipsScreen(),
            );
          }),
      GoRoute(
          path: kMomTipsScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<GetAllTipsOfMomCubit>(),
              child: const MomTipsScreen(),
            );
          }),
      GoRoute(
          path: kTipDetailsScreen,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<GetTipDetailsCubit>(),
              child: const TipDetailsScreenBody(),
            );
          }),
      GoRoute(
          path: kEntertainmentScreen,
          builder: (context, state) {
            return const EntertainmentScreen();
          }),
      GoRoute(
          path: kSweetSleep,
          builder: (context, state) {
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => getIt<GetMusicCubit>()..getMusic(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<GetWhiteNoiseCubit>()..getWhiteNoise(),
              ),
            ], child: const SweetSleepPageView());
          }),
      GoRoute(
        path: kShortStoriesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<GetAllStoriesCubit>(),
            child: const ShortStoriesScreen(),
          );
        },
      ),
      GoRoute(
        path: kStoryDetailsScreen,
        builder: (context, state) {
          final story = state.extra as StoryData;
          return StoryDetailsScreenBody(story: story);
        },
      ),
      GoRoute(
          path: kWhiteNoise,
          builder: (context, state) {
            return const SweetSleepPageTwo();
          }),
      GoRoute(
        path: kStoryDetailsScreen,
        builder: (context, state) {
          final story = state.extra as StoryData;
          return StoryDetailsScreenBody(story: story);
        },
      ),
      GoRoute(
        path: kFunVideosScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<GetAllChannelsCubit>(),
            child: const FunVideoScreen(),
          );
        },
      ),
      GoRoute(
        path: kDoctorsScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<GetAllDoctorsCubit>()..getAllDoctors(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<GetAllHospitalsCubit>()..getAllHospitals(),
              ),
            ],
            child: const DoctorsScreen(),
          );
        },
      ),
      GoRoute(
        path: kDoctorDetailsScreen,
        builder: (context, state) {
          final doctorData = state.extra as DoctorData;
          return BlocProvider(
            create: (context) => getIt<DoctorBookingCubit>(),
            child: DoctorDetailsScreenBody(
              doctorData: doctorData,
            ),
          );
        },
      ),
      GoRoute(
        path: kMyAppointmentsScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetBookedAppointmentsCubit>(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<GetAllDoctorsCubit>()..getAllDoctors(),
              ),
              BlocProvider(
                create: (context) => getIt<CancelBookedAppointmentCubit>(),
              ),
            ],
            child: const MyAppointmentScreenBody(),
          );
        },
      ),
    ],
  );
}
