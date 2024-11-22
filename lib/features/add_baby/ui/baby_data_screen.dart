import 'package:care_nest/features/add_baby/ui/widgets/baby_data_bloc_builder.dart';
import 'package:flutter/material.dart';

class BabyDataScreen extends StatelessWidget {
  const BabyDataScreen({
    super.key, required this.babyId,
  });
final String babyId;
  @override
  Widget build(BuildContext context) {
    return BabyDataBlocBuilder(babyId: babyId);
  }
}
