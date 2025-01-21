import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  // Checks and requests location permissions.
  Future<bool> _checkPermission() async {
    print('Checking permissions...'); // Debug print
    if (await _checkService()) {
      PermissionStatus permissionStatus = await _location.hasPermission();
      print('Current Permission Status: $permissionStatus'); // Debug print
      if (permissionStatus == PermissionStatus.denied) {
        print('Requesting location permission...'); // Debug print
        permissionStatus = await _location.requestPermission();
        print('New Permission Status: $permissionStatus'); // Debug print
      }
      return permissionStatus == PermissionStatus.granted;
    }
    return false;
  }

  // Ensures that location service is enabled.
  Future<bool> _checkService() async {
    print('Checking location service...'); // Debug print
    bool serviceEnabled;
    try {
      serviceEnabled = await _location.serviceEnabled();
      print('Location Service Enabled: $serviceEnabled'); // Debug print
      if (!serviceEnabled) {
        print('Requesting to enable location service...'); // Debug print
        serviceEnabled = await _location.requestService();
        print('Location Service Enabled After Request: $serviceEnabled'); // Debug print
      }
    } on PlatformException catch (e) {
      print('Error: Code=${e.code}, Message=${e.message}');
      return false;
    }
    return serviceEnabled;
  }

  // Gets the current location data.
  Future<LocationData?> getLocation() async {
    print('Getting location...'); // Debug print
    if (await _checkPermission()) {
      try {
        LocationData locationData = await _location.getLocation();
        print('Location Data: $locationData'); // Debug print
        return locationData;
      } catch (e) {
        print('Error getting location: $e');
        return null;
      }
    }
    print('Permission not granted.'); // Debug print
    return null;
  }
}

void printLocation() async {
  print('Starting location service...'); // Debug print
  LocationService locationService = LocationService();
  
  // الحصول على الموقع الحالي
  print('Requesting location...'); // Debug print
  LocationData? locationData = await locationService.getLocation();
  
  if (locationData != null) {
    // طباعة خط الطول ودائرة العرض
    print('Latitude: ${locationData.latitude}');
    print('Longitude: ${locationData.longitude}');
  } else {
    print('Unable to get location.'); // Debug print
  }
}