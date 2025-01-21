import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../view/deaitls_page.dart';
import 'dart:convert';
import '../models/location_model.dart';
import '../services/location_service.dart';

class MapController extends GetxController {
  final LocationService locationService = LocationService();

  // Completer للتحكم في خريطة Google Maps
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  // قائمة بالمواقع المحددة
  final List<LocationModel> locations = [
    // lat: 32.3688058, long: 44.5435611>
    LocationModel(
      latitude: 32.3688058,
      longitude: 44.5435611,
      name: "My Home",
    ),
    LocationModel(
      latitude: 32.372000,
      longitude: 44.547000,
      name: "الموقع 1",
    ),
    // 32.367986, 44.544480

    LocationModel(
      latitude: 32.367986,
      longitude: 44.544480,
      name: "الحسينيه",
    ),
    // 32.363734, 44.548268

    LocationModel(
      latitude: 32.363734,
      longitude: 44.548268,
      name: "الكوفي",
    ),
    // 32.363473, 44.549068

    LocationModel(
      latitude: 32.363473,
      longitude: 44.549068,
      name: "الموقع 3",
    ),
  ];

  // إحداثيات الموقع الحالي
  var lat = 0.0.obs;
  var lng = 0.0.obs;

  // قائمة النقاط (Markers)
  var markers = <Marker>[].obs;

  // قائمة بخطوط الطرق (Polylines)
  var polylines = <Polyline>[].obs;

  // Stream لتحديثات الموقع
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void onInit() {
    super.onInit();
    getLocation(); // الحصول على الموقع عند بدء التشغيل
    goToCurrentLocation();
    _startLocationTracking(); // بدء تتبع الموقع بشكل دوري
    _addMarkers(); // إضافة النقاط إلى الخريطة
  }

  @override
  void onClose() {
    _locationSubscription?.cancel(); // إيقاف التتبع عند إغلاق الصفحة
    super.onClose();
  }

  // دالة للحصول على الموقع الحالي
  void getLocation() async {
    LocationData? locationData = await locationService.getLocation();

    if (locationData != null) {
      lat.value = locationData.latitude!;
      lng.value = locationData.longitude!;

      // إضافة Marker لموقعك الحالي
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

      // رسم خطوط الطرق إلى جميع النقاط
      // _drawPolylines();
    } else {
      print('Unable to get location.');
    }
  }

  // دالة لبدء تتبع الموقع بشكل دوري
  void _startLocationTracking() {
    Location location = Location();

    _locationSubscription =
        location.onLocationChanged.listen((LocationData locationData) {
      goToCurrentLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        lat.value = locationData.latitude!;
        lng.value = locationData.longitude!;

        // التحقق من الوصول إلى أي موقع
        for (var location in locations) {
          double distance = _calculateDistance(
            lat.value,
            lng.value,
            location.latitude,
            location.longitude,
          );

          // إذا كانت المسافة أقل من 13 مترًا، الانتقال إلى صفحة أخرى
          if (distance < 50) {
            _navigateToDetailsPage(location);
            break; // إيقاف التحقق بعد الوصول إلى موقع واحد
          }
        }
      }
    });
  }

  // دالة للانتقال إلى صفحة التفاصيل
  void _navigateToDetailsPage(LocationModel location) {
    Get.to(() => DetailsPage(location: location));
  }

  // دالة لإضافة النقاط إلى الخريطة
  void _addMarkers() {
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

  // // دالة لرسم خطوط الطرق
  // void _drawPolylines() async {
  //   List<Polyline> newPolylines = [];

  //   for (var location in locations) {
  //     try {
  //       List<LatLng> points = await _getDirections(
  //         LatLng(lat.value, lng.value), // موقعك الحالي
  //         LatLng(location.latitude, location.longitude), // النقطة المحددة
  //       );

  //       newPolylines.add(
  //         Polyline(
  //           polylineId: PolylineId('polyline_${location.name}'),
  //           points: points,
  //           color: Colors.blue,
  //           width: 5,
  //         ),
  //       );
  //     } catch (e) {
  //       print('Error drawing polyline to ${location.name}: $e');
  //     }
  //   }

  //   polylines.value = newPolylines;
  // }

  // // دالة للحصول على بيانات الاتجاهات من Directions API
  // Future<List<LatLng>> _getDirections(LatLng origin, LatLng destination) async {
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=YOUR_API_KEY';

  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);

  //     if (data['status'] == 'OK') {
  //       List<LatLng> points = [];
  //       data['routes'][0]['legs'][0]['steps'].forEach((step) {
  //         points.addAll(_decodePolyline(step['polyline']['points']));
  //       });
  //       return points;
  //     } else {
  //       throw Exception(
  //           'Directions API Error: ${data['status']} - ${data['error_message'] ?? 'No error message'}');
  //     }
  //   } else {
  //     throw Exception(
  //         'Failed to load directions. Status code: ${response.statusCode}');
  //   }
  // }

  // // دالة لفك تشفير Polyline
  // List<LatLng> _decodePolyline(String encoded) {
  //   List<LatLng> points = [];
  //   int index = 0, len = encoded.length;
  //   int lat = 0, lng = 0;

  //   while (index < len) {
  //     int b, shift = 0, result = 0;
  //     do {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1f) << shift;
  //       shift += 5;
  //     } while (b >= 0x20);
  //     int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
  //     lat += dlat;

  //     shift = 0;
  //     result = 0;
  //     do {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1f) << shift;
  //       shift += 5;
  //     } while (b >= 0x20);
  //     int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
  //     lng += dlng;

  //     points.add(LatLng(lat / 1e5, lng / 1e5));
  //   }
  //   return points;
  // }

  // دالة لحساب المسافة بين نقطتين
  double _calculateDistance(
      double lat1, double lng1, double lat2, double lng2) {
    const double earthRadius = 6371000; // نصف قطر الأرض بالأمتار
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

  // تحويل الدرجات إلى راديان
  double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  // دالة للانتقال إلى الموقع الحالي
  Future<void> goToCurrentLocation() async {
    if (controller.isCompleted) {
      final GoogleMapController controller1 = await controller.future;
      await controller1.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat.value, lng.value), // موقعك الحالي
            zoom: 50.50, // مستوى التكبير
          ),
        ),
      );
    }
  }
}
