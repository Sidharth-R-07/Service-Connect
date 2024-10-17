import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:service_connect/features/location/domain/model/location_model.dart';

@lazySingleton
class LocationServices {
  Future<LocationModel?> getCurrentLocation() async {
    bool? serviceEnabled;
    LocationPermission? permission;
    log('Getting current location');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    log('Service Enabled: $serviceEnabled');
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();

    log('Permission: $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are denied Forever');
      }
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      log(place.toJson().toString());

      return LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        locality: place.locality,
        city: place.subAdministrativeArea,
        country: place.country,
        state: place.administrativeArea,
      );
    }
    return null;
  }
}
