import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/controllers/language_controller.dart';
import '../controllers/map_controller.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = Get.put(MapController());
  Timer? _timer;
  final LanguageController languageController = Get.put(LanguageController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        mapController.getLocation();
        mapController.goToCurrentLocation();
        mapController.startLocationTracking();
      });
      print('1 \n');
    });
  }

  @override
  Widget build(BuildContext context) {
    languageController.getAllLandmarks();
    mapController.startLocationTracking();
    mapController.getLocation();
    mapController.goToCurrentLocation();
    mapController.addMarkers();
    return Scaffold(
      body: Obx(() {
        return GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(mapController.lat.value, mapController.lng.value),
            zoom: 50.50,
            bearing: mapController.bearing,
          ),
          markers: Set<Marker>.from(mapController.markers),
          polylines: Set<Polyline>.from(mapController.polylines),
          onMapCreated: (GoogleMapController controller) {
            mapController.controller.complete(controller);
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          mapController.getLocation();
          mapController.goToCurrentLocation();
        },
        label: const Text('موقعي الحالي'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}
