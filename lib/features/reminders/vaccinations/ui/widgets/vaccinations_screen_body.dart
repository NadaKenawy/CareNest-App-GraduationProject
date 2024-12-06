import 'package:care_nest/core/helpers/constants.dart';
import 'package:care_nest/core/helpers/shared_pref_helper.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/reminders/vaccinations/ui/widgets/vaccines_sidebar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'vaccination_list.dart';

class VaccinationsScreenBody extends StatefulWidget {
  const VaccinationsScreenBody({super.key});
  @override
  State<VaccinationsScreenBody> createState() => _VaccinationsScreenBodyState();
}

class _VaccinationsScreenBodyState extends State<VaccinationsScreenBody> {
  final SidebarXController _controller = SidebarXController(selectedIndex: -1);
  String? selectedBabyName = '';
  int? selectedIndex;
  String? babyId;
  List<bool> isPressedList = List.generate(12, (_) => false);
  @override
  void initState() {
    super.initState();
    loadBabyData();
  }

  Future<void> loadBabyData() async {
    final babyIdFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyId);
    final babyNameFromStorage =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.babyName);
    setState(() {
      babyId = babyIdFromStorage;
      selectedBabyName = babyNameFromStorage;
    });
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
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 24),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: VaccinationsSidebarX(
        controller: _controller,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedBabyName: (String name) {
          setState(() {
            selectedBabyName = name;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: VaccinationList(
          isPressedList: isPressedList,
          onItemPressed: (index) {
            setState(() {
              isPressedList[index] = !isPressedList[index];
            });
          },
        ),
      ),
    );
  }
}
