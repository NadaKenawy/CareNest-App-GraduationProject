import 'package:care_nest/features/doctors/ui/widgets/get_all_doctors_bloc_builder.dart';
import 'package:care_nest/features/doctors/ui/widgets/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/doctors_app_bar.dart';
import 'doctors_toggle_button.dart';

class DoctorsScreenBody extends StatefulWidget {
  const DoctorsScreenBody({super.key});

  @override
  State<DoctorsScreenBody> createState() => _DoctorsScreenBodyState();
}

class _DoctorsScreenBodyState extends State<DoctorsScreenBody> {
  String selectedOption = 'Pediatricians';
  bool isMapView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoctorsAppBar(onOptionSelected: (option) {
                  setState(() {
                    selectedOption = option;
                    if (selectedOption == 'Hospitals & Pharmacies') {
                      isMapView = true;
                    } else {
                      isMapView = false;
                    }
                  });
                }),
                SizedBox(height: 16.h),
                if (selectedOption != 'Hospitals & Pharmacies')
                  DoctorsToggleButton(
                    onToggle: (index) {
                      setState(() {
                        isMapView = index == 1;
                      });
                    },
                  ),
                SizedBox(
                    height: selectedOption == 'Hospitals & Pharmacies'
                        ? 0.h
                        : 24.h),
                _buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedOption == 'Hospitals & Pharmacies' || isMapView) {
      return MapView(
        selectedSpecialty: selectedOption,
        isHospitalView: selectedOption == 'Hospitals & Pharmacies',
      );
    }
    switch (selectedOption) {
      case 'Pediatricians':
      case 'Gynecologists':
        return GetAllDoctorsBlocBuilder(selectedSpecialty: selectedOption);
      default:
        return const Center(child: Text('No data found'));
    }
  }
}
