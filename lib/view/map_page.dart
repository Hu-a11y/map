import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapPage extends StatelessWidget {
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(mapController.lat.value, mapController.lng.value),
            zoom: 14.4746,
          ),
          markers: Set<Marker>.from(mapController.markers),
          polylines: Set<Polyline>.from(mapController.polylines),
          onMapCreated: (GoogleMapController controller) {
            mapController.controller
                .complete(controller); // استخدام _controller هنا
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          mapController.getLocation(); // تحديث الموقع الحالي
          mapController.goToCurrentLocation(); // الانتقال إلى الموقع الحالي
        },
        label: const Text('موقعي الحالي'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}
