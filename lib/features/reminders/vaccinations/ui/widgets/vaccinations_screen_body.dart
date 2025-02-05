import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/get_baby_vaccines_bloc_builder.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccines_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VaccinationsScreenBody extends StatefulWidget {
  const VaccinationsScreenBody({super.key});

  @override
  _VaccinationsScreenBodyState createState() => _VaccinationsScreenBodyState();
}

class _VaccinationsScreenBodyState extends State<VaccinationsScreenBody> {
  String? selectedBabyName = '';
  String? selectedBabyId = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final babyName =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    final babyId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);

    setState(() {
      selectedBabyName = babyName;
      selectedBabyId = babyId;
      isLoading = false;
    });

    if (selectedBabyId != null && selectedBabyId!.isNotEmpty) {
      context.read<GetBabyVaccinesCubit>().getBabyVaccines(selectedBabyId!);
    }
  }

  void onBabySelected(String name, String id) async {
    setState(() {
      isLoading = true;
    });
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);

    setState(() {
      selectedBabyName = name;
      selectedBabyId = id;
      isLoading = false;
    });

    context.read<GetBabyVaccinesCubit>().getBabyVaccines(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedBabyName?.isNotEmpty == true
              ? "${selectedBabyName![0].toUpperCase()}${selectedBabyName!.substring(1)}'s Vaccinations"
              : 'My Vaccinations',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: VaccinationsSidebar(
        selectedBabyName: selectedBabyName ?? '',
        onBabySelected: (name, id) {
          onBabySelected(name, id);
        },
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (selectedBabyId != null && selectedBabyId!.isNotEmpty)
              ? const GetBabyVaccinesBlocBuilder()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Center(
                    child: Text(
                      'Select a baby from the sidebar to view their vaccinations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 28.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
    );
  }
}
