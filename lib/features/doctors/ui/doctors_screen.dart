import 'package:flutter/material.dart';
import 'package:care_nest/features/doctors/ui/widgets/doctors_screen_body.dart';

import '../service/location_service.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  void initState() {
    super.initState();
    LocationService.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const DoctorsScreenBody();
  }
}
