import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Position? currentPosition;

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location service is disabled');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permission denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permission permanently denied');
      return null;
    }

    currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    log('Current location: ${currentPosition?.longitude}, ${currentPosition?.latitude}');
    return currentPosition;
  }
}
