import 'package:care_nest/features/add_baby/data/models/get_baby_data_response.dart';
import 'package:care_nest/features/add_baby/ui/widgets/baby_data_screen_body.dart';
import 'package:flutter/material.dart';

class BabyDataScreen extends StatelessWidget {
  final BabyData babyData;

  const BabyDataScreen({super.key, required this.babyData});

  @override
  Widget build(BuildContext context) {
    return BabyDataScreenBody(babyData: babyData);
  }
}
