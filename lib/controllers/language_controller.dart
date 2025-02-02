import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:map/constant/language.dart';
import 'package:map/generated/l10n.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

    
    final List<dynamic> decodedJson = jsonDecode(landmarksJson);

    
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

  getWhoWeAreText(context) {
    return S.of(context).whoWeAre;
  }

  getBackToMapText(context) {
    return S.of(context).backToMap;
  }

  final FlutterTts flutterTts = FlutterTts();
  bool isSpeak = false;
  Future<void> speak(String text) async {
    await flutterTts.setLanguage(Get.locale.toString());
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
    isSpeak = true;
    update();
  }

  Future<void> stopSpeak() async {
    await flutterTts.stop();
    isSpeak = false;
    update();
  }
}
