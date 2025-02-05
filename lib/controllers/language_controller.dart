import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:map/constant/language.dart';
import 'package:map/generated/l10n.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/landmark.dart';
import 'package:flutter/services.dart' show rootBundle;

class LanguageController extends GetxController {
  bool isArabic = Get.locale == 'ar';

  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  List<Landmark> landmarks = [];

  getAllLandmarks() async {
    String jsonString = await rootBundle.loadString('lib/l10n/intl_en.arb');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> landmarksList =
        jsonMap['landmarks'] != null ? json.decode(jsonMap['landmarks']) : [];
    landmarks = landmarksList.map((e) => Landmark.fromJson(e)).toList();
    update();
  }
  Landmark? getLandmarkByIndex(BuildContext context, int index) {
  final jsonString = S.of(context)!.landmarks;
  final List<dynamic> jsonList = jsonDecode(jsonString);

  if (index >= 0 && index < jsonList.length) {
    return Landmark.fromJson(jsonList[index]);
  }
  return null;
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
