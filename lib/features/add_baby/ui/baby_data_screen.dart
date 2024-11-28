import 'package:care_nest/features/add_baby/ui/widgets/baby_data_screen_body.dart';
import 'package:flutter/material.dart';

import '../data/models/get_all_babies/get_all_babies_response.dart';

class BabyDataScreen extends StatelessWidget {
  const BabyDataScreen({
    super.key,
    required this.babiesData,
  });
  final BabiesData babiesData;
  @override
  Widget build(BuildContext context) {
    return BabyDataScreenBody(babiesData: babiesData);
  }
}
