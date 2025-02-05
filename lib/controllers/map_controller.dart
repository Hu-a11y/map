import 'dart:async';
import 'dart:math';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:map/controllers/language_controller.dart';
import 'package:map/view/drawer_page.dart';
import '../constant/color.dart';
import '../view/deaitls_page.dart';
import 'dart:convert';
import '../models/location_model.dart';
import '../services/location_service.dart';

class MapController extends GetxController {
  final LocationService locationService = LocationService();
  LanguageController controller12 = LanguageController();


  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  
  final List<LocationModel> locations = [
    // lat: 32.3688058, long: 44.5435611>

    LocationModel(
      // 32.393153, 44.398025
      latitude: 32.393153,
      longitude: 44.398025,
      name: "Ishtar Gate",
    ),
    // LocationModel(
    //   latitude: 32.541630,
    //   longitude: 44.424030,
    //   name: "Ishtar Gate",
    // ),
  ];

  
  var lat = 0.0.obs;
  var lng = 0.0.obs;

  var markers = <Marker>[].obs;

 
  var polylines = <Polyline>[].obs;

 
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void onInit() {
    super.onInit();
    controller12.getAllLandmarks();
    getLocation(); 
    goToCurrentLocation();
    startLocationTracking(); 
    addMarkers();
  }

  @override
  void onClose() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    startLocationTracking(); 
  }

  
  void getLocation() async {
    LocationData? locationData = await locationService.getLocation();

    if (locationData != null) {
      // 32.393139, 44.398030
      lat.value =
          // 32.393139;

          // 32.493122;
          locationData.latitude!;
      lng.value =
          // 44.398030;
          // 44.418219;
          locationData.longitude!;

      markers.add(
        Marker(
          
          markerId: const MarkerId('current_location'),
          position: LatLng(lat.value, lng.value),
          infoWindow: const InfoWindow(
            title: 'موقعك الحالي',
            snippet: 'هذا هو موقعك الحالي على الخريطة',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    } else {
      print('Unable to get location.');
    }
  }

  double bearing = 0.0;

  void startLocationTracking() {
    if (_locationSubscription != null) {
      return; 
    }

    Location location = Location();
    FlutterCompass.events?.listen((CompassEvent event) {
      bearing = event.heading ?? 0;
    });

    _locationSubscription =
        location.onLocationChanged.listen((LocationData locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
           // 32.393139, 44.398030
      lat.value =
          // 32.393139;

          // 32.493122;
          locationData.latitude!;
      lng.value =
          // 44.398030;
          // 44.418219;
          locationData.longitude!;


          for (var location in locations) {
            double distance = _calculateDistance(
              lat.value,
              lng.value,
              location.latitude,
              location.longitude,
            );
            int? index;

            if (controller12.landmarks != null) {
              for (var i = 0; i < controller12.landmarks!.length; i++) {
                if (controller12.landmarks![i].title.toUpperCase() ==
                    location.name.toUpperCase()) {
                  index = i;
                }
              }
            }

            if (index != null && distance < 10) {
              _navigateToDetailsPage(index);
              break;
            }
          }
        });
      }
    });
  }

  
  void _navigateToDetailsPage(int ifs) {
    // 32.493122, 44.418219

    Get.to(Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: Stack(
        children: [
          DrawerScreen(index: ifs),
          DetailsPage(
            index: ifs,
          ),
        ],
      ),
    ));
  }

  void addMarkers() {
    for (var location in locations) {
      markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: location.name,
            snippet: 'هذا هو ${location.name}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
  }

  double _calculateDistance(
      double lat1, double lng1, double lat2, double lng2) {
    const double earthRadius = 6371000;
    double dLat = _toRadians(lat2 - lat1);
    double dLng = _toRadians(lng2 - lng1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  Future<void> goToCurrentLocation() async {
    if (controller.isCompleted) {
      final GoogleMapController controller1 = await controller.future;
      await controller1.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat.value, lng.value),
            zoom: 50.50,
          ),
        ),
      );
    }
  }
}
