import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/map_controller.dart';
import '../models/location_model.dart';

class DetailsPage extends StatelessWidget {
  final LocationModel location;

  DetailsPage({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الموقع'),
      ),
      body: GetBuilder(
        init: MapController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الموقع: ${location.name}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'الإحداثيات: (${location.latitude}, ${location.longitude})',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'بيانات التوقع: ...', // يمكنك إضافة بيانات التوقع هنا
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}