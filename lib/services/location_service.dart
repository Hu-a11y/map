import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<bool> _checkPermission() async {
    if (await _checkService()) {
      PermissionStatus permissionStatus = await _location.hasPermission();

      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
      }
      return permissionStatus == PermissionStatus.granted;
    }
    return false;
  }

  Future<bool> _checkService() async {
    bool serviceEnabled;
    try {
      serviceEnabled = await _location.serviceEnabled();

      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
      }
    } on PlatformException catch (e) {
      print(e.message);
      return false;
    }
    return serviceEnabled;
  }

  Future<LocationData?> getLocation() async {
    if (await _checkPermission()) {
      try {
        LocationData locationData = await _location.getLocation();

        return locationData;
      } catch (e) {
        return null;
      }
    }

    return null;
  }
}

void printLocation() async {
  LocationService locationService = LocationService();

  LocationData? locationData = await locationService.getLocation();

  if (locationData != null) {
    print('Latitude: ${locationData.latitude}');
    print('Longitude: ${locationData.longitude}');
  } else {
    print('Unable to get location.'); // Debug print
  }
}
