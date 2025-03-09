import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(30.0444, 31.2357);
  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('hospital1'),
      position: const LatLng(30.0500, 31.2333),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          HSVColor.fromColor(ColorsManager.secondryBlueColor).hue),
      infoWindow: const InfoWindow(
        title: "Al Salam International Hospital",
        snippet: "8 A Tahrir St, Dokki, Giza",
      ),
    ),
    Marker(
      markerId: const MarkerId('hospital2'),
      position: const LatLng(30.0460, 31.2300),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          HSVColor.fromColor(ColorsManager.secondryBlueColor).hue),
      infoWindow: const InfoWindow(
        title: "Cairo Medical Center",
        snippet: "Nasr City, Cairo",
      ),
    ),
    Marker(
      markerId: const MarkerId('pharmacy1'),
      position: const LatLng(30.0485, 31.2355),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          HSVColor.fromColor(ColorsManager.secondryBlueColor).hue),
      infoWindow: const InfoWindow(
        title: "El Ezaby Pharmacy",
        snippet: "Downtown, Cairo",
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
