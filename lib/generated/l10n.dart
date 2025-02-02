// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `[{"title": "IT Info", "subtitle": "Symbol of Ancient Babylon", "description": "The Ishtar Gate is one of the wonders of the ancient world, symbolizing power and magnificence.", "image": "assets/images/23900739.png", "audio": "ishtar_gate.mp3"},{"title": "Ishtar Gate", "subtitle": "Symbol of Ancient Babylon", "description": "The Ishtar Gate is one of the wonders of the ancient world, symbolizing power and magnificence.", "image": "assets/images/23900739.png", "audio": "ishtar_gate.mp3"}, {"title": "Hanging Gardens", "subtitle": "One of the Seven Wonders", "description": "The Hanging Gardens of Babylon showcase the beauty of nature and engineering.", "image": "hanging_gardens.jpg", "audio": "hanging_gardens.mp3"}, {"title": "Babylon Ziggurat", "subtitle": "A Grand Temple", "description": "The ziggurat was a religious center in Babylon and a marvel of engineering.", "image": "babylon_ziggurat.jpg", "audio": "babylon_ziggurat.mp3"}, {"title": "Babylon Walls", "subtitle": "City Defenses", "description": "The great walls of Babylon were one of the greatest feats of defensive engineering.", "image": "babylon_walls.jpg", "audio": "babylon_walls.mp3"}, {"title": "Euphrates River", "subtitle": "Lifeblood of Babylon", "description": "The Euphrates River was a source of life and development in Babylon.", "image": "euphrates_river.jpg", "audio": "euphrates_river.mp3"}, {"title": "Marduk Gate", "subtitle": "Sacred Entrance", "description": "The Marduk Gate was a principal gateway in the city of Babylon.", "image": "marduk_gate.jpg", "audio": "marduk_gate.mp3"}, {"title": "Nebuchadnezzar’s Palace", "subtitle": "Royal Residence", "description": "The palace of Nebuchadnezzar was an example of royal grandeur.", "image": "nebuchadnezzar_palace.jpg", "audio": "nebuchadnezzar_palace.mp3"}, {"title": "Ishtar Temple", "subtitle": "Place of Worship", "description": "The Ishtar Temple was a religious center dedicated to the goddess Ishtar.", "image": "ishtar_temple.jpg", "audio": "ishtar_temple.mp3"}, {"title": "Inner City", "subtitle": "Heart of Babylon", "description": "The inner city of Babylon was the center of social and political life.", "image": "inner_city.jpg", "audio": "inner_city.mp3"}, {"title": "Babylon Library", "subtitle": "A Center of Knowledge", "description": "The Babylon Library was one of the world’s earliest libraries.", "image": "babylon_library.jpg", "audio": "babylon_library.mp3"}]`
  String get landmarks {
    return Intl.message(
      '[{"title": "IT Info", "subtitle": "Symbol of Ancient Babylon", "description": "The Ishtar Gate is one of the wonders of the ancient world, symbolizing power and magnificence.", "image": "assets/images/23900739.png", "audio": "ishtar_gate.mp3"},{"title": "Ishtar Gate", "subtitle": "Symbol of Ancient Babylon", "description": "The Ishtar Gate is one of the wonders of the ancient world, symbolizing power and magnificence.", "image": "assets/images/23900739.png", "audio": "ishtar_gate.mp3"}, {"title": "Hanging Gardens", "subtitle": "One of the Seven Wonders", "description": "The Hanging Gardens of Babylon showcase the beauty of nature and engineering.", "image": "hanging_gardens.jpg", "audio": "hanging_gardens.mp3"}, {"title": "Babylon Ziggurat", "subtitle": "A Grand Temple", "description": "The ziggurat was a religious center in Babylon and a marvel of engineering.", "image": "babylon_ziggurat.jpg", "audio": "babylon_ziggurat.mp3"}, {"title": "Babylon Walls", "subtitle": "City Defenses", "description": "The great walls of Babylon were one of the greatest feats of defensive engineering.", "image": "babylon_walls.jpg", "audio": "babylon_walls.mp3"}, {"title": "Euphrates River", "subtitle": "Lifeblood of Babylon", "description": "The Euphrates River was a source of life and development in Babylon.", "image": "euphrates_river.jpg", "audio": "euphrates_river.mp3"}, {"title": "Marduk Gate", "subtitle": "Sacred Entrance", "description": "The Marduk Gate was a principal gateway in the city of Babylon.", "image": "marduk_gate.jpg", "audio": "marduk_gate.mp3"}, {"title": "Nebuchadnezzar’s Palace", "subtitle": "Royal Residence", "description": "The palace of Nebuchadnezzar was an example of royal grandeur.", "image": "nebuchadnezzar_palace.jpg", "audio": "nebuchadnezzar_palace.mp3"}, {"title": "Ishtar Temple", "subtitle": "Place of Worship", "description": "The Ishtar Temple was a religious center dedicated to the goddess Ishtar.", "image": "ishtar_temple.jpg", "audio": "ishtar_temple.mp3"}, {"title": "Inner City", "subtitle": "Heart of Babylon", "description": "The inner city of Babylon was the center of social and political life.", "image": "inner_city.jpg", "audio": "inner_city.mp3"}, {"title": "Babylon Library", "subtitle": "A Center of Knowledge", "description": "The Babylon Library was one of the world’s earliest libraries.", "image": "babylon_library.jpg", "audio": "babylon_library.mp3"}]',
      name: 'landmarks',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `contact us`
  String get contact {
    return Intl.message(
      'contact us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get setting {
    return Intl.message(
      'settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Who We Are`
  String get whoWeAre {
    return Intl.message(
      'Who We Are',
      name: 'whoWeAre',
      desc: '',
      args: [],
    );
  }

  /// `back to map`
  String get backToMap {
    return Intl.message(
      'back to map',
      name: 'backToMap',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
