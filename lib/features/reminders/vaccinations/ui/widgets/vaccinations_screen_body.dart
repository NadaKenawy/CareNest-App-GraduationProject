// ignore_for_file: use_build_context_synchronously
import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/get_baby_vaccines_bloc_builder.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccines_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:care_nest/features/reminders/vaccinations/logic/get_baby_vaccines_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationsScreenBody extends StatefulWidget {
  const VaccinationsScreenBody({super.key});

  @override
  State<VaccinationsScreenBody> createState() => _VaccinationsScreenBodyState();
}

class _VaccinationsScreenBodyState extends State<VaccinationsScreenBody> {
  String? selectedBabyName = '';
  String? selectedBabyId = '';

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

    if (babyName != selectedBabyName || babyId != selectedBabyId) {
      setState(() {
        selectedBabyName = babyName ?? '';
        selectedBabyId = babyId ?? '';
      });
      if (selectedBabyId != null && selectedBabyId!.isNotEmpty) {
        context.read<GetBabyVaccinesCubit>().getBabyVaccines(selectedBabyId!);
      }
    }
  }

  void onBabySelected(String name, String id) async {
    setState(() {
      selectedBabyName = name;
      selectedBabyId = id;
    });
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyName, name);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.babyId, id);
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
      body: selectedBabyId != null && selectedBabyId!.isNotEmpty
          ? const GetBabyVaccinesBlocBuilder()
          : const Center(child: Text('No baby selected')),
    );
  }
}
