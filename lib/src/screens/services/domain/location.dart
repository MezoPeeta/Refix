import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
Future<Position> getCurrentPosition(Ref ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error("Please enable your location services (GPS)");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Please enable your location services (GPS)");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error("Please enable your location services (GPS)");
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

@riverpod
Future<Placemark?> getPlacemark(Ref ref) async {
  final position = await ref.watch(getCurrentPositionProvider.future);
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks.first;
  } catch (e) {}
  return null;
}
