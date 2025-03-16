import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/features/doctors/data/models/get_doctors/get_doctors_response.dart';
import 'package:care_nest/features/doctors/data/models/get_hospitals/get_hospitals_response.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import 'package:care_nest/features/doctors/logic/get_all_doctors_cubit/get_all_doctors_state.dart'
    as doctors_state;
import 'package:care_nest/features/doctors/logic/get_hospitals_cubit/get_all_hospitals_state.dart'
    as hospitals_state;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../logic/get_hospitals_cubit/get_all_hospitals_cubit.dart';

class MapView extends StatefulWidget {
  final String selectedSpecialty;

  final bool isHospitalView;

  const MapView({
    super.key,
    required this.selectedSpecialty,
    this.isHospitalView = false,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  LatLng _initialPosition = const LatLng(31.2685013, 32.2658171);

  void _updateDoctorMarkers(List<DoctorData> doctors) {
    final newMarkers = <Marker>{};
    for (var doctor in doctors) {
      if (doctor.specialty != widget.selectedSpecialty) continue;
      if (doctor.location?.coordinates != null &&
          doctor.location!.coordinates!.length == 2) {
        final lat = doctor.location!.coordinates![1];
        final lng = doctor.location!.coordinates![0];
        newMarkers.add(
          Marker(
            markerId: MarkerId(doctor.id ?? UniqueKey().toString()),
            position: LatLng(lat, lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              HSVColor.fromColor(ColorsManager.secondryBlueColor).hue,
            ),
            infoWindow: InfoWindow(
              title:
                  '${doctor.user?.firstName ?? ''} ${doctor.user?.lastName ?? ''}${doctor.specialty != null ? ' - ${doctor.specialty}' : ''}',
              snippet: doctor.location!.address ?? '',
            ),
          ),
        );
      }
    }
    _markers.clear();
    _markers.addAll(newMarkers);
  }

  void _updateHospitalMarkers(List<HospitalData> hospitals) {
    final newMarkers = <Marker>{};
    for (var hospital in hospitals) {
      if (hospital.position != null) {
        final lat = hospital.position!.lat ?? _initialPosition.latitude;
        final lng = hospital.position!.lng ?? _initialPosition.longitude;
        newMarkers.add(
          Marker(
            markerId: MarkerId(hospital.title ?? UniqueKey().toString()),
            position: LatLng(lat, lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              HSVColor.fromColor(ColorsManager.secondryBlueColor).hue,
            ),
            infoWindow: InfoWindow(
              title: hospital.title ?? '',
              snippet: hospital.label ?? '',
            ),
          ),
        );
      }
    }
    _markers.clear();
    _markers.addAll(newMarkers);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isHospitalView
        ? BlocBuilder<GetAllHospitalsCubit,
            hospitals_state.GetAllHospitalsState>(
            builder: (context, state) {
              if (state is hospitals_state.Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is hospitals_state.Error) {
                return const Center(child: Text('Error loading hospitals'));
              } else if (state is hospitals_state.Success) {
                final hospitals = state.hospitalsData ?? [];
                _updateHospitalMarkers(hospitals);
                if (_markers.isNotEmpty) {
                  _initialPosition = _markers.first.position;
                }
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14.0,
                  ),
                  markers: _markers,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    if (_markers.isNotEmpty) {
                      mapController.animateCamera(
                        CameraUpdate.newLatLngZoom(_markers.first.position, 16),
                      );
                    }
                  },
                ),
              );
            },
          )
        : BlocBuilder<GetAllDoctorsCubit, doctors_state.GetAllDoctorsState>(
            builder: (context, state) {
              if (state is doctors_state.Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is doctors_state.Error) {
                return const Center(child: Text('Error loading doctors'));
              } else if (state is doctors_state.Success) {
                final doctors = state.doctorsData ?? [];
                _updateDoctorMarkers(doctors);
                if (_markers.isNotEmpty) {
                  _initialPosition = _markers.first.position;
                }
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14.0,
                  ),
                  markers: _markers,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    if (_markers.isNotEmpty) {
                      mapController.animateCamera(
                        CameraUpdate.newLatLngZoom(_markers.first.position, 16),
                      );
                    }
                  },
                ),
              );
            },
          );
  }
}
