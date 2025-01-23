import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:map/constant/language.dart';
import 'package:map/generated/l10n.dart';

import '../models/landmark.dart';

class LanguageController extends GetxController {
  bool isArabic = Get.locale == 'ar';

  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  changeLanguage() {
    if (languageChosen == languages[0]) {
      languageChosen = languages[1];
    } else {
      languageChosen = languages[0];
    }

    update();
  }

  List<Landmark>? landmarks;
  getAllLandmarks(context) {
    final String landmarksJson = S.of(context).landmarks;

    // Decode the JSON string to a list of maps
    final List<dynamic> decodedJson = jsonDecode(landmarksJson);

    // Convert the list of maps to a list of Landmark objects
    landmarks = decodedJson
        .map((landmarkJson) => Landmark.fromJson(landmarkJson))
        .toList();
    update();
  }

  getLanguageText(context) {
    return S.of(context).language;
  }

  getContactText(context) {
    return S.of(context).contact;
  }

  getSettingText(context) {
    return S.of(context).setting;
  }
}
