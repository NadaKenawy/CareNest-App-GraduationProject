import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/doctors_list_view.dart';
import '../widgets/doctors_app_bar.dart';
import 'doctors_toggle_button.dart';

class DoctorsScreenBody extends StatefulWidget {
  const DoctorsScreenBody({super.key});

  @override
  State<DoctorsScreenBody> createState() => _DoctorsScreenBodyState();
}

class _DoctorsScreenBodyState extends State<DoctorsScreenBody> {
  String selectedOption = 'Pediatricians';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoctorsAppBar(onOptionSelected: (option) {
                  setState(() {
                    selectedOption = option;
                  });
                }),
                SizedBox(height: 24.h),
                const DoctorsToggleButton(),
                SizedBox(height: 24.h),
                _buildContent(selectedOption),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String selectedOption) {
    switch (selectedOption) {
      case 'Pediatricians':
        return const DoctorsListView();
      case 'Gynecologists':
        return const Center(child: Text('Gynecologists'));
      case 'Hospitals & Pharmacies':
        return const Center(child: Text('Hospitals & Pharmacies'));
      default:
        return const Center(child: Text('No data found'));
    }
  }
}
